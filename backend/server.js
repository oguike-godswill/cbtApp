import 'dotenv/config';
import crypto from 'crypto';
import express from 'express';
import cors from 'cors';
import { GoogleGenAI } from '@google/genai';

const app = express();
app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 3000;
const MODEL = process.env.GEMINI_MODEL || 'gemini-4-hydrogen';
const ai = process.env.GEMINI_API_KEY
  ? new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY })
  : null;

const SYSTEM_PROMPT = `You are NaijaPrep AI Tutor, an encouraging Nigerian NERDC 9-3-4 curriculum teacher for Primary 6 (NCEE), JSS 1-3 (BECE), SS 1-3 (WAEC/NECO), and JAMB UTME students. Give clear, step-by-step explanations, Nigerian real-world analogies, and fast exam shortcuts.`;

app.get('/api/health', (_req, res) => {
  res.json({
    ok: true,
    geminiReady: Boolean(ai),
    model: MODEL,
  });
});

app.get('/api/packs/manifest', (_req, res) => {
  res.json({
    version: 1,
    packs: [
      { id: 'pack_math_ss_v1', title: 'SS Mathematics (WAEC & JAMB Core)', version: 1 },
      { id: 'pack_eng_orals_v1', title: 'English Language & Test of Orals', version: 1 },
      { id: 'pack_ncee_bece_v1', title: 'NCEE & BECE Core Foundations', version: 1 },
      { id: 'pack_eco_phy_v1', title: 'Economics & Physics Core (SS / UTME)', version: 1 },
      { id: 'pack_bio_chm_v1', title: 'Biology & Chemistry Core (WAEC & JAMB)', version: 1 },
      { id: 'pack_gov_ss_v1', title: 'Government & Civic Education (WAEC & JAMB)', version: 1 }
    ]
  });
});

app.get('/api/packs/:id', (req, res) => {
  const pack = {
    id: 'pack_gov_ss_v1',
    subjectCode: 'GOV',
    title: 'Government & Civic Education (WAEC & JAMB)',
    examTrack: 'waec_neco',
    nerdcLevel: 'SS 1–3',
    version: 1,
    lessons: [
      {
        id: 'lesson_gov_federalism',
        moduleTitle: 'Nigerian Constitutional Development',
        orderIndex: 1,
        title: 'Federalism & Separation of Powers',
        estimatedMinutes: 8,
        objectives: ['Explain Exclusive, Concurrent, and Residual legislative lists'],
        simpleSummaryMarkdown: 'Federalism shares power between Abuja (Federal) and the 36 States. Exclusive items (Defence, Currency) belong only to Abuja; Concurrent items (Education, Health) are shared.',
        formalSummaryMarkdown: 'Federalism is a constitutional division of powers between a central government and component units. Under the 1999 Nigerian Constitution, powers are divided into the Exclusive, Concurrent, and Residual lists.',
        keyRules: ['Exclusive List = Federal only', 'Concurrent List = Federal + State (Federal prevails on conflict)'],
        steps: []
      }
    ],
    questions: [
      {
        id: 'q_gov_waec_2023_1',
        relatedLessonId: 'lesson_gov_federalism',
        examBody: 'WAEC',
        examYear: 2023,
        paperType: 'objective',
        stemMarkdown: 'Under Nigeria’s 1999 Constitution, which legislative list contains Defence and Foreign Affairs?',
        options: ['Exclusive List', 'Concurrent List', 'Residual List', 'Local List'],
        correctIndex: 0,
        answerSummary: 'Exclusive List',
        workedSteps: ['Defence and Foreign Affairs are reserved solely for the Federal Government.', 'Hence they sit on the Exclusive Legislative List.'],
        distractorNotes: {
          '1': 'Concurrent List covers shared items like Education and Health.',
          '2': 'Residual List belongs to State Houses of Assembly.',
          '3': 'Local List is not a constitutional legislative list.'
        },
        examinerTip: 'Whenever a power affects national sovereignty (currency, defence, immigration), it is Exclusive.',
        difficulty: 'easy'
      }
    ]
  };
  const raw = JSON.stringify(pack);
  const sha256 = crypto.createHash('sha256').update(raw).digest('hex');
  res.json({ pack, sha256 });
});

app.post('/api/tutor/explain', async (req, res) => {
  const { title = '', context = '', question = '' } = req.body || {};
  if (!ai) {
    return res.status(503).json({
      error: 'GEMINI_API_KEY not configured on backend proxy.',
    });
  }
  try {
    const response = await ai.models.generateContent({
      model: MODEL,
      contents: `Topic: ${title}\nContext: ${context}\nStudent Question: ${question}`,
      config: { systemInstruction: SYSTEM_PROMPT },
    });
    res.json({ answer: response.text || 'No response generated.' });
  } catch (err) {
    res.status(500).json({ error: String(err) });
  }
});

app.post('/api/tutor/chat', async (req, res) => {
  const { messages = [] } = req.body || {};
  if (!ai) {
    return res.status(503).json({ error: 'GEMINI_API_KEY not configured.' });
  }
  res.setHeader('Content-Type', 'text/event-stream');
  res.setHeader('Cache-Control', 'no-cache');
  res.setHeader('Connection', 'keep-alive');

  try {
    const prompt = messages.map((m) => `${m.role}: ${m.content}`).join('\n');
    const stream = await ai.models.generateContentStream({
      model: MODEL,
      contents: prompt,
      config: { systemInstruction: SYSTEM_PROMPT },
    });
    for await (const chunk of stream) {
      if (chunk.text) {
        res.write(`data: ${JSON.stringify({ text: chunk.text })}\n\n`);
      }
    }
    res.write('data: [DONE]\n\n');
    res.end();
  } catch (err) {
    res.write(`data: ${JSON.stringify({ error: String(err) })}\n\n`);
    res.end();
  }
});

app.listen(PORT, () => {
  console.log(`NaijaPrep Backend Proxy listening on http://localhost:${PORT}`);
});
