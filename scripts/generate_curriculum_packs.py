import hashlib
import json
import os
import random

OUT_DIR = os.path.join(os.path.dirname(__file__), "..", "assets", "packs")
os.makedirs(OUT_DIR, exist_ok=True)

# 33 NERDC Subjects matching the full Nigerian Curriculum specification
SUBJECTS = [
    # Core & General
    ("MTH", "Mathematics", "waec_neco", "SS 1–3 / UTME", [
        ("Algebraic Processes", "Quadratic Equations & Factorization", "Solve quadratic equations by factorization, completing the square, and formula."),
        ("Trigonometry", "Trigonometric Ratios & CAST Rule", "Apply SOH-CAH-TOA and quadrant signs to evaluate angles."),
        ("Geometry", "Circle Theorems & Polygons", "Use angle at centre, cyclic quadrilateral, and tangent theorems."),
        ("Calculus", "Differentiation & Rates of Change", "Differentiate polynomials and find stationary points."),
        ("Statistics", "Mean, Median, Mode & Variance", "Compute measures of central tendency and dispersion."),
        ("Number & Numeration", "Indices, Logarithms & Surds", "Simplify expressions using laws of indices and logarithms."),
    ]),
    ("ENG", "English Language", "jamb_utme", "SS 1–3 / UTME", [
        ("Oral English", "Vowel Contrasts & Emphatic Stress", "Distinguish /iː/ vs /ɪ/ and identify emphatic stress targets."),
        ("Lexis & Structure", "Subject-Verb Concord Rules", "Apply proximity and parenthetical concord accurately."),
        ("Comprehension", "Inference & Tone Analysis", "Anchor comprehension answers directly to passage evidence."),
        ("Essay Writing", "Formal Letters & Argumentative Essays", "Structure thesis statements, topic sentences, and formal salutations."),
        ("Vocabulary", "Idioms, Antonyms & Synonyms", "Interpret idiomatic expressions in context."),
        ("Grammar", "Clauses, Tenses & Reported Speech", "Transform direct speech and identify adjectival/adverbial clauses."),
    ]),
    ("LIT", "Literature-in-English", "waec_neco", "SS 1–3 / UTME", [
        ("Prose", "African & Non-African Prose Analysis", "Analyze characterization, setting, and narrative point of view."),
        ("Drama", "Tragedy, Comedy & Dramatic Irony", "Identify soliloquy, aside, catharsis, and tragic flaws."),
        ("Poetry", "Poetic Devices & Meter", "Recognize metaphor, personification, enjambment, and rhyme schemes."),
        ("Literary Appreciation", "Unseen Prose & Poetry", "Evaluate mood, tone, and imagery in unseen passages."),
        ("African Literature", "Oral Tradition & Post-Colonial Themes", "Examine themes of cultural conflict and leadership."),
        ("Non-African Texts", "Renaissance & Modern Drama", "Trace plot structure and conflict resolution."),
    ]),
    ("CIV", "Civic Education", "waec_neco", "SS 1–3", [
        ("Citizenship", "Rights, Duties & Obligations", "Distinguish civic rights from constitutional duties."),
        ("Democracy", "Rule of Law & Separation of Powers", "Explain checks and balances among executive, legislature, and judiciary."),
        ("Human Rights", "UDHR & Fundamental Rights", "Identify enforceable rights in Chapter IV of the 1999 Constitution."),
        ("National Values", "Integrity, Contentment & Discipline", "Apply civic values to anti-corruption and nation-building."),
        ("Public Service", "Civil Service & Ombudsman", "Understand accountability in Nigerian public institutions."),
        ("Social Issues", "Cultism, Drug Abuse & Traffic Laws", "Identify preventive measures and statutory agencies (FRSC, NDLEA)."),
    ]),
    # Science & Technology
    ("BIO", "Biology", "waec_neco", "SS 1–3 / UTME", [
        ("Cell Biology", "Diffusion, Osmosis & Plasmolysis", "Predict water movement across selectively permeable membranes."),
        ("Genetics", "Mendelian Inheritance & Punnett Squares", "Compute monohybrid and dihybrid phenotypic ratios."),
        ("Ecology", "Food Chains, Biomes & Nutrient Cycles", "Trace energy flow and carbon/nitrogen cycles in ecosystems."),
        ("Human Anatomy", "Circulatory & Respiratory Systems", "Describe blood components, heart chambers, and gaseous exchange."),
        ("Plant Physiology", "Photosynthesis & Transpiration", "Identify limiting factors and stomatal regulation."),
        ("Evolution & Classification", "Taxonomy & Adaptation", "Classify organisms using binomial nomenclature."),
    ]),
    ("CHM", "Chemistry", "waec_neco", "SS 1–3 / UTME", [
        ("Stoichiometry", "Mole Concept & Molar Gas Volume", "Convert mass, moles, molarity, and STP gas volumes (22.4 dm³)."),
        ("Atomic Structure", "Periodic Trends & Bonding", "Compare ionization energy, electronegativity, and ionic/covalent bonds."),
        ("Acids & Bases", "pH Scale, Titration & Salts", "Calculate molar concentrations from acid-base titrations."),
        ("Electrochemistry", "Redox Reactions & Faraday's Laws", "Balance half-equations and compute mass deposited during electrolysis."),
        ("Organic Chemistry", "Alkanes, Alkenes & Functional Groups", "Name hydrocarbons using IUPAC nomenclature and identify isomerism."),
        ("Chemical Kinetics", "Rates of Reaction & Equilibrium", "Apply Le Chatelier's principle to industrial processes."),
    ]),
    ("PHY", "Physics", "waec_neco", "SS 1–3 / UTME", [
        ("Mechanics", "SUVAT Equations & Projectile Motion", "Apply equations of uniformly accelerated motion."),
        ("Electricity", "Ohm's Law, Circuits & Power", "Analyze series/parallel resistors and compute electrical energy."),
        ("Waves & Optics", "Refraction, Lenses & Sound Waves", "Use Snell's law, mirror/lens formula, and wave equation v = fλ."),
        ("Thermal Physics", "Gas Laws & Specific Heat Capacity", "Apply Boyle's, Charles's, and heat transfer equations."),
        ("Electromagnetism", "Transformers & Electromagnetic Induction", "Calculate turns ratio and induced EMF."),
        ("Modern Physics", "Radioactivity & Photoelectric Effect", "Compute half-life decay and nuclear binding energy."),
    ]),
    ("FMH", "Further Mathematics", "waec_neco", "SS 1–3", [
        ("Pure Algebra", "Polynomials, Remainder Theorem & Matrices", "Find determinants, inverses, and roots of cubics."),
        ("Calculus", "Integration & Differential Equations", "Evaluate definite integrals and areas under curves."),
        ("Vectors & Mechanics", "Dot Product, Projectiles & Impulse", "Resolve forces and compute momentum conservation."),
        ("Coordinate Geometry", "Conic Sections: Parabola & Ellipse", "Derive equations of tangents and normals."),
        ("Probability", "Binomial & Normal Distributions", "Calculate expected values and standard deviations."),
        ("Series & Sequences", "Binomial Expansion & Mathematical Induction", "Expand (a + bx)^n and prove identities by induction."),
    ]),
    ("AGR", "Agricultural Science", "waec_neco", "SS 1–3", [
        ("Soil Science", "Soil Profile, pH & Fertility", "Manage soil erosion, liming, and organic/inorganic fertilizers."),
        ("Crop Production", "Cereals, Legumes & Crop Rotation", "Design 4-course crop rotation plans and pest control."),
        ("Animal Husbandry", "Poultry, Ruminants & Nutrition", "Formulate balanced rations and manage livestock diseases."),
        ("Agricultural Economics", "Farm Accounts & Elasticity", "Prepare profit/loss accounts and analyze farm supply."),
        ("Farm Mechanization", "Tractor Implements & Irrigation", "Maintain ploughs, harrows, and drip irrigation systems."),
        ("Forestry & Wildlife", "Agroforestry & Conservation", "Apply taungya farming and forest preservation laws."),
    ]),
    ("ICT", "Computer Studies / ICT", "waec_neco", "SS 1–3", [
        ("Hardware & Logic", "CPU, Memory & Logic Gates", "Evaluate AND, OR, NOT, NAND, and NOR truth tables."),
        ("Number Systems", "Binary, Octal & Hexadecimal", "Convert between base 2, base 8, base 10, and base 16."),
        ("Programming", "Algorithms, Flowcharts & BASIC/Python", "Trace loops, conditionals, and variable assignments."),
        ("Networking", "Topologies, OSI Model & Protocols", "Distinguish LAN, WAN, TCP/IP, HTTP, and DNS."),
        ("Software", "Operating Systems & Utilities", "Explain process scheduling, file systems, and compilers."),
        ("Cybersecurity", "Malware, Encryption & Ethics", "Apply strong authentication and data protection practices."),
    ]),
    ("TDR", "Technical Drawing", "waec_neco", "SS 1–3", [
        ("Geometric Construction", "Polygons, Tangents & Loci", "Construct regular polygons and involutes accurately."),
        ("Orthographic Projection", "First & Third Angle Views", "Project front, end, and plan elevations from 3D objects."),
        ("Isometric & Oblique", "Pictorial Drawing & Scales", "Draw isometric circles using four-centre approximation."),
        ("Sectioning", "Full, Half & Offset Sections", "Apply hatching conventions for engineering parts."),
        ("Building Drawing", "Floor Plans & Roof Trusses", "Read architectural symbols, doors, and foundation details."),
        ("Screw Threads & Fasteners", "Nuts, Bolts & Cam Profiles", "Represent standard ISO metric threads and displacement diagrams."),
    ]),
    # Arts & Humanities
    ("GOV", "Government", "waec_neco", "SS 1–3 / UTME", [
        ("Constitutionalism", "Federalism & Legislative Lists", "Distinguish Exclusive, Concurrent, and Residual lists."),
        ("Political Systems", "Presidential vs Parliamentary Systems", "Compare fusion of powers with separation of powers."),
        ("Pre-Colonial Nigeria", "Hausa/Fulani, Yoruba & Igbo Systems", "Contrast centralized emirates with decentralized acephalous polities."),
        ("Colonial Administration", "Clifford to Lyttelton Constitutions", "Trace constitutional milestones from 1922 to 1960."),
        ("International Orgs", "ECOWAS, AU, UN & Commonwealth", "Identify organs, objectives, and Nigeria's foreign policy."),
        ("Electoral Systems", "INEC, Franchise & Pressure Groups", "Evaluate simple plurality vs proportional representation."),
    ]),
    ("HIS", "History", "waec_neco", "SS 1–3 / UTME", [
        ("Nigerian History", "Nok, Ife, Benin & Kanem-Bornu", "Examine early Nigerian centres of civilization and trade."),
        ("Trans-Saharan & Atlantic", "Trade Routes & Abolition", "Analyze economic and social impacts of external trade."),
        ("19th Century Nigeria", "Sokoto Caliphate & Yoruba Wars", "Trace state formation and reform movements."),
        ("Colonial Rule", "Indirect Rule & Nationalism", "Evaluate nationalist movements from NCNC to independence."),
        ("Post-Independence", "First Republic to Democratic Transition", "Understand constitutional crises and national integration."),
        ("World Civilizations", "Industrial Revolution & Cold War", "Connect global shifts to African decolonization."),
    ]),
    ("CRS", "Christian Religious Studies (CRS)", "waec_neco", "SS 1–3 / UTME", [
        ("Old Testament", "Creation, Covenant & Leadership", "Examine leadership lessons from Joseph, Moses, and David."),
        ("Prophetic Ministry", "Amos, Hosea & Isaiah", "Analyze calls for social justice and true worship."),
        ("Synoptic Gospels", "Parables, Miracles & Sermon on the Mount", "Interpret teachings on forgiveness, humility, and faith."),
        ("Passion & Resurrection", "Trial, Crucifixion & Great Commission", "Trace events of Holy Week across the Gospels."),
        ("Early Church", "Pentecost, Acts & Paul's Journeys", "Examine the spread of Christianity and Council of Jerusalem."),
        ("Christian Living", "Epistles on Civic Duty & Family", "Apply Paul's teachings on spiritual gifts and dignity of labour."),
    ]),
    ("IRS", "Islamic Religious Studies (IRS)", "waec_neco", "SS 1–3 / UTME", [
        ("Al-Quran", "Revelation, Compilation & Selected Surahs", "Study Tafsir and moral lessons of Makkan and Madinan Surahs."),
        ("Hadith", "Sciences of Hadith & An-Nawawi", "Distinguish Sahih, Hasan, and Da'if narrations."),
        ("Fiqh & Ibadah", "Five Pillars of Islam & Purification", "Apply rules of Salat, Zakat, Sawm, and Hajj."),
        ("Sirah", "Life of Prophet Muhammad (SAW)", "Trace Hijrah, Constitution of Madinah, and Treaty of Hudaybiyyah."),
        ("Khulafa ar-Rashidun", "The Four Rightly Guided Caliphs", "Examine administrative reforms of Abu Bakr to Ali."),
        ("Islamic Morality", "Akhlaq, Family & Social Justice", "Apply Islamic ethics on honesty, charity, and tolerance."),
    ]),
    ("GEO", "Geography", "waec_neco", "SS 1–3 / UTME", [
        ("Map Reading", "Scale, Contours & Bearings", "Calculate ground distance, gradient, and cross-sections."),
        ("Geomorphology", "Rocks, Weathering & Landforms", "Distinguish igneous, sedimentary, and metamorphic rocks."),
        ("Climatology", "Atmosphere, Winds & Koppen Climate", "Explain planetary winds, rainfall types, and Nigerian climate belts."),
        ("Population", "Density, Migration & Urbanization", "Analyze population pyramids and rural-urban migration."),
        ("Economic Geography", "Minerals, Transport & Trade", "Locate Nigeria's mineral belts and industrial zones."),
        ("GIS & Remote Sensing", "Spatial Data & Satellite Imagery", "Understand raster/vector data and GPS applications."),
    ]),
    ("ART", "Visual Arts / Fine Art", "waec_neco", "SS 1–3", [
        ("Elements & Principles", "Line, Colour, Balance & Rhythm", "Apply primary, secondary, and complementary colour harmonies."),
        ("Drawing & Painting", "Perspective, Shading & Media", "Use one-point and two-point linear perspective."),
        ("Nigerian Art History", "Nok, Igbo-Ukwu, Ife & Benin Bronzes", "Identify lost-wax (cire perdue) casting and terracotta traditions."),
        ("Sculpture & Ceramics", "Carving, Modelling & Firing", "Compare additive and subtractive sculpture techniques."),
        ("Graphics & Textiles", "Typography, Batik & Tie-Dye", "Design posters and resist-dyeing patterns (Adire)."),
        ("Art Appreciation", "Criticism & Curatorial Practice", "Evaluate form, content, and cultural symbolism."),
    ]),
    ("MUS", "Music", "waec_neco", "SS 1–3", [
        ("Rudiments", "Staff Notation, Clefs & Time Signatures", "Read treble/bass clefs and simple/compound time."),
        ("Scales & Intervals", "Major, Minor & Key Signatures", "Construct diatonic scales and invert intervals."),
        ("Harmony", "Triads, Cadences & Four-Part Writing", "Identify perfect, plagal, imperfect, and interrupted cadences."),
        ("African Instruments", "Idiophones, Membranophones & Chordophones", "Classify Talking Drum, Ogene, Kakaki, and Goje."),
        ("Western History", "Baroque, Classical & Romantic Periods", "Recognize forms like Sonata, Fugue, and Symphony."),
        ("Nigerian Art Music", "Fela Sowande, Akin Euba & Highlife", "Trace evolution of Nigerian contemporary and traditional music."),
    ]),
    # Commercial & Business
    ("ECO", "Economics", "waec_neco", "SS 1–3 / UTME", [
        ("Price Theory", "Demand, Supply & Market Equilibrium", "Solve equilibrium price and quantity equations."),
        ("Elasticity", "Price & Income Elasticity", "Compute PED and classify elastic vs inelastic goods."),
        ("Production & Cost", "Law of Diminishing Returns & Costs", "Distinguish fixed, variable, average, and marginal costs."),
        ("Market Structures", "Perfect Competition vs Monopoly", "Compare profit maximization conditions (MC = MR)."),
        ("National Income", "GDP, GNP & Multiplier", "Calculate GDP via income, output, and expenditure methods."),
        ("Money & Trade", "CBN, Inflation & Comparative Advantage", "Analyze monetary policy tools and balance of payments."),
    ]),
    ("ACC", "Financial Accounting", "waec_neco", "SS 1–3 / UTME", [
        ("Double Entry", "Ledgers, Trial Balance & Errors", "Apply debit/credit rules and correct suspense accounts."),
        ("Cash Book", "Three-Column Cash Book & Bank Reconciliation", "Reconcile unpresented cheques and uncredited lodgements."),
        ("Final Accounts", "Trading, Profit & Loss & Balance Sheet", "Adjust for accruals, prepayments, and depreciation."),
        ("Control Accounts", "Debtors & Creditors Ledgers", "Verify total receivables and payables."),
        ("Partnership & Company", "Goodwill, Appropriation & Shares", "Distribute partnership profits and issue share capital."),
        ("Public Sector", "Consolidated Revenue Fund & Votes", "Distinguish capital and recurrent government expenditure."),
    ]),
    ("COM", "Commerce", "waec_neco", "SS 1–3 / UTME", [
        ("Trade", "Home Trade, Retail & Wholesale", "Compare functions of wholesalers, supermarkets, and e-commerce."),
        ("Foreign Trade", "Documents & Customs Procedures", "Distinguish Bill of Lading, Consular Invoice, and Letter of Credit."),
        ("Business Units", "Sole Proprietorship, PLC & Cooperatives", "Evaluate limited liability and sources of capital."),
        ("Banking & Finance", "Commercial Banks, Cheques & CBN", "Identify crossed cheques and electronic payment rails."),
        ("Insurance", "Indemnity, Utmost Good Faith & Subrogation", "Apply core principles of marine, fire, and life insurance."),
        ("Transport & Warehousing", "Modes & Containerization", "Select optimal transport for perishable vs bulky goods."),
    ]),
    ("OFP", "Office Practice", "waec_neco", "SS 1–3", [
        ("Office Organization", "Centralized vs Decentralized Filing", "Organize alphabetical, numerical, and chronological filing."),
        ("Communication", "Business Letters, Memos & Etiquette", "Draft formal memoranda and minutes of meetings."),
        ("Office Equipment", "Reprographics, Scanners & Shredders", "Select appropriate machines for document workflows."),
        ("Mail Handling", "Incoming, Outgoing & Courier Logs", "Maintain dispatch books and postage registers."),
        ("Human Resources", "Recruitment, Appraisal & Payroll", "Understand job descriptions and statutory deductions."),
        ("Meetings", "Notice, Agenda, Quorum & Minutes", "Apply standing orders and voting procedures."),
    ]),
    ("MKT", "Marketing", "waec_neco", "SS 1–3", [
        ("Marketing Mix", "The 4Ps & 7Ps of Services", "Balance product, price, place, and promotion strategies."),
        ("Consumer Behaviour", "Buying Decision Process", "Map need recognition through post-purchase evaluation."),
        ("Market Research", "Primary vs Secondary Data & Sampling", "Design questionnaires and focus groups."),
        ("Product & Branding", "Product Life Cycle & Packaging", "Manage introduction, growth, maturity, and decline stages."),
        ("Pricing & Distribution", "Penetration, Skimming & Channels", "Choose direct vs multi-tier distribution channels."),
        ("Advertising & Digital", "AIDA Model & E-Marketing", "Measure campaign reach and customer retention."),
    ]),
    # Languages
    ("NGL", "Nigerian Languages (Yoruba, Igbo, Hausa)", "waec_neco", "SS 1–3 / UTME", [
        ("Yoruba Orthography", "Àmì Ohùn (Tone Marks) & Àṣà", "Distinguish Do (low), Re (mid), and Mi (high) tones."),
        ("Igbo Grammar", "Ụdaume (Vowels) & Ilulu (Proverbs)", "Apply Igbo vowel harmony (ATR) and proverbs."),
        ("Hausa Language", "Bako da Aiki & Karin Magana", "Use Hausa noun genders, tense markers, and idioms."),
        ("Oral Literature", "Oriki, Egwu & Tatsuniya", "Analyze praise poetry and folktales across Nigerian cultures."),
        ("Translation", "Idiomatic Translation Skills", "Translate proverbs accurately between Nigerian languages and English."),
        ("Culture & Kinship", "Marriage, Naming & Traditional Governance", "Compare cultural institutions across Yoruba, Igbo, and Hausa."),
    ]),
    ("FRL", "Foreign Languages (French, Arabic, German, Spanish)", "waec_neco", "SS 1–3 / UTME", [
        ("French Grammar", "Articles, Être/Avoir & Passé Composé", "Conjugate regular -er/-ir/-re and auxiliary verbs."),
        ("Arabic Language", "Nahw, Sarf & Reading Comprehension", "Identify Ism, Fi'l, Harf and nominal/verbal sentences."),
        ("German Basics", "Nominative, Accusative & Word Order", "Apply V2 verb placement and gendered articles (der/die/das)."),
        ("Spanish Basics", "Ser vs Estar & Present Tense", "Distinguish permanent traits from temporary states/locations."),
        ("Conversational Skills", "Greetings, Travel & Shopping", "Respond appropriately in everyday dialogues."),
        ("Cultural Literacy", "Francophone, Arab & Hispanic Worlds", "Identify major cultural capitals and traditions."),
    ]),
    # Vocational & Trade Subjects
    ("DPR", "Data Processing", "waec_neco", "SS 1–3", [
        ("Databases", "RDBMS, Primary Keys & SQL", "Design normalized tables and write SELECT/WHERE queries."),
        ("Spreadsheets", "Formulas, Functions & Pivot Charts", "Use SUM, AVERAGE, IF, and VLOOKUP cleanly."),
        ("Word Processing", "Formatting, Mail Merge & Tables", "Automate bulk letters using mail merge."),
        ("Data Representation", "Bits, Bytes & ASCII/Unicode", "Calculate file sizes and storage capacities."),
        ("System Maintenance", "Backups, Defragmentation & Safety", "Prevent data loss and hardware ESD damage."),
        ("Web & Presentation", "HTML Basics & Slide Design", "Structure semantic HTML tags and readable slides."),
    ]),
    ("CCP", "Catering Craft Practice", "waec_neco", "SS 1–3", [
        ("Kitchen Hygiene", "HACCP, Food Safety & Sanitation", "Prevent cross-contamination and foodborne illness."),
        ("Nutrition", "Macronutrients, Vitamins & Menu Planning", "Balance meals for children, convalescents, and vegetarians."),
        ("Cooking Methods", "Moist, Dry & Combination Heat", "Select poaching, grilling, braising, and baking techniques."),
        ("Pastry & Baking", "Yeast Doughs, Rubbing-In & Sauces", "Prepare roux-based mother sauces and shortcrust pastry."),
        ("Food & Beverage Service", "Table Setting & Hospitality", "Execute silver service, buffet, and guest billing."),
        ("Costing & Portioning", "Recipe Costing & Yield Control", "Calculate food cost percentage and selling price."),
    ]),
    ("GAR", "Garment Making", "waec_neco", "SS 1–3", [
        ("Textiles", "Natural vs Synthetic Fibres", "Identify cotton, silk, wool, polyester, and care labels."),
        ("Body Measurements", "Taking Accurate Anthropometric Data", "Measure bust, waist, hip, shoulder, and sleeve length."),
        ("Pattern Drafting", "Basic Bodice, Skirt & Sleeve Blocks", "Apply seam allowances, darts, and grainlines."),
        ("Sewing Equipment", "Lockstitch Machines & Overlockers", "Thread machines, adjust tension, and fix skipped stitches."),
        ("Garment Construction", "Seams, Zippers, Collars & Hems", "Finish raw edges with French seams and bias binding."),
        ("Entrepreneurship", "Boutique Costing & Quality Control", "Calculate fabric yardage and garment pricing."),
    ]),
    ("PHO", "Photography", "waec_neco", "SS 1–3", [
        ("Exposure Triangle", "Aperture, Shutter Speed & ISO", "Balance depth of field, motion blur, and sensor sensitivity."),
        ("Lenses & Optics", "Focal Length: Wide, Standard & Telephoto", "Select lenses for portraiture, landscapes, and sports."),
        ("Composition", "Rule of Thirds, Leading Lines & Framing", "Compose balanced visual stories."),
        ("Lighting", "Natural, Three-Point & Flash", "Control key, fill, and rim lighting ratios."),
        ("Digital Workflow", "RAW vs JPEG & Colour Grading", "Perform non-destructive exposure and white-balance edits."),
        ("Ethics & Business", "Model Releases, Copyright & Studio Setup", "Manage client contracts and archival backups."),
    ]),
    ("ANH", "Animal Husbandry", "waec_neco", "SS 1–3", [
        ("Breeds & Selection", "Cattle, Sheep, Goats, Pigs & Rabbits", "Identify indigenous and exotic breeds in Nigeria."),
        ("Anatomy & Digestion", "Ruminant vs Monogastric Systems", "Compare rumen fermentation with simple-stomach digestion."),
        ("Animal Nutrition", "Concentrates, Roughages & Feed Formulation", "Balance protein, energy, minerals, and clean water."),
        ("Reproduction", "Oestrus, Artificial Insemination & Gestation", "Manage breeding calendars and parturition care."),
        ("Health & Biosecurity", "Vaccination, Parasites & Quarantine", "Prevent Newcastle, Foot-and-Mouth, and coccidiosis."),
        ("Housing & Records", "Deep Litter, Battery Cage & Farm Logs", "Calculate feed conversion ratio (FCR) and mortality rate."),
    ]),
    ("FIS", "Fisheries", "waec_neco", "SS 1–3", [
        ("Aquaculture Systems", "Earthen Ponds, Concrete & Tarpaulin Tanks", "Site, construct, and lime fish ponds properly."),
        ("Species Biology", "Catfish (Clarias) & Tilapia", "Distinguish air-breathing catfish from mouthbrooding tilapia."),
        ("Water Quality", "Dissolved Oxygen, pH, Ammonia & Temperature", "Monitor Secchi disc turbidity and aeration."),
        ("Fish Nutrition", "Floating vs Sinking Pellets & FCR", "Calculate daily feeding rate by biomass."),
        ("Induced Breeding", "Hypophysation, Hatching & Fry Care", "Manage broodstock, stripping, and fingerling grading."),
        ("Harvesting & Preservation", "Smoking, Freezing & Value Addition", "Reduce post-harvest spoilage using smoking kilns."),
    ]),
    ("AUT", "Auto Mechanics", "waec_neco", "SS 1–3", [
        ("Engine Systems", "Four-Stroke Cycle & Compression", "Trace intake, compression, power, and exhaust strokes."),
        ("Fuel & Ignition", "Carburettor, EFI & Spark Timing", "Diagnose rich/lean mixtures and misfires."),
        ("Lubrication & Cooling", "Oil Viscosity, Radiator & Thermostat", "Prevent overheating and bearing wear."),
        ("Transmission", "Clutch, Gearbox & Differential", "Calculate gear ratios and inspect clutch plates."),
        ("Brakes & Suspension", "Hydraulic Disc/Drum & Shock Absorbers", "Bleed brake lines and inspect master cylinders."),
        ("Auto Electrical", "12V Battery, Alternator & Starter Motor", "Test charging voltage (13.8V–14.4V) and fuses."),
    ]),
    ("ELC", "Electrical Installation & Maintenance", "waec_neco", "SS 1–3", [
        ("Electrical Safety", "Earthing, PPE & IEE Wiring Regulations", "Isolate circuits and test earth continuity."),
        ("Circuit Theory", "Ohm's Law, Power & Cable Sizing", "Select MCB ratings and conductor cross-sections."),
        ("Domestic Wiring", "Ring Main, Radial & Two-Way Switching", "Wire 13A sockets, lighting points, and consumer units."),
        ("Motors & Starters", "Single-Phase, Three-Phase & DOL Starters", "Connect overload relays and contactor coils."),
        ("Testing & Faults", "Insulation Resistance & Polarity Tests", "Use a Megger and multimeter to locate open/short circuits."),
        ("Solar & Inverters", "PV Panels, Charge Controllers & Batteries", "Size off-grid solar backup systems safely."),
    ]),
]

# Domain-specific question factories so questions are authentic, varied, and parameterized!
def make_math_q(idx, lesson_id, body, year, rng):
    variant = idx % 4
    if variant == 0:
        r1 = rng.choice([-5, -4, -3, -2, -1, 1, 2, 3, 4, 5])
        r2 = rng.choice([-4, -3, -2, -1, 1, 2, 3, 4, 5, 6])
        b = -(r1 + r2)
        c = r1 * r2
        b_str = f"+ {b}x" if b > 0 else (f"- {-b}x" if b < 0 else "")
        c_str = f"+ {c}" if c >= 0 else f"- {-c}"
        ans = f"$x = {r1}$ or $x = {r2}$"
        wrongs = [
            f"$x = {-r1}$ or $x = {-r2}$",
            f"$x = {r1 + 1}$ or $x = {r2 - 1}$",
            f"$x = {r1}$ or $x = {-r2}$",
        ]
        if len(set([ans] + wrongs)) < 4:
            wrongs = [f"$x = {r1 + 2}$ or $x = {r2}$", f"$x = {r1 - 2}$ or $x = {r2 + 2}$", f"$x = {r1 + 3}$ or $x = {r2 - 3}$"]
        stem = f"Solve the quadratic equation $x^2 {b_str} {c_str} = 0$."
        steps = [
            f"Identify factors of $c = {c}$ that sum to $b = {b}$: they are ${-r1}$ and ${-r2}$ (signs in brackets).",
            f"Factorize: $(x - ({r1}))(x - ({r2})) = 0$.",
            f"Set each bracket to zero to obtain $x = {r1}$ or $x = {r2}$."
        ]
        tip = "Substitute one root back into the equation in CBT to verify it evaluates to 0."
        ans_sum = f"x = {r1} or {r2}"
    elif variant == 1:
        a = rng.randint(2, 6)
        x_val = rng.randint(2, 9)
        k = rng.randint(3, 12)
        rhs = a * x_val + k
        stem = f"Solve for $x$ if ${a}x + {k} = {rhs}$."
        ans = f"$x = {x_val}$"
        wrongs = [f"$x = {x_val + 1}$", f"$x = {x_val + 2}$", f"$x = {max(1, x_val - 1)}$"]
        steps = [
            f"Subtract ${k}$ from both sides: ${a}x = {rhs} - {k} = {rhs - k}$.",
            f"Divide both sides by ${a}$: $x = \\frac{{{rhs - k}}}{{{a}}} = {x_val}$."
        ]
        tip = "Always isolate the variable term before dividing by its coefficient."
        ans_sum = f"x = {x_val}"
    elif variant == 2:
        n = rng.randint(2, 6)
        coeff = rng.randint(2, 8)
        stem = f"Find $\\frac{{dy}}{{dx}}$ if $y = {coeff}x^{{{n}}}$."
        ans = f"${coeff * n}x^{{{n - 1}}}$"
        wrongs = [
            f"${coeff * n}x^{{{n}}}$",
            f"${coeff}x^{{{n - 1}}}$",
            f"${coeff * (n + 1)}x^{{{n - 1}}}$",
        ]
        steps = [
            "Apply the power rule $\\frac{d}{dx}(ax^n) = anx^{n-1}$.",
            f"Multiply coefficient ${coeff}$ by power ${n}$ to get ${coeff * n}$, and reduce exponent to ${n - 1}$."
        ]
        tip = "Never forget to reduce the exponent by 1 after multiplying."
        ans_sum = f"{coeff * n}x^{n - 1}"
    else:
        angle = rng.choice([30, 45, 60])
        fn = rng.choice(["sin", "cos", "tan"])
        table = {
            ("sin", 30): "1/2", ("sin", 45): "√2/2", ("sin", 60): "√3/2",
            ("cos", 30): "√3/2", ("cos", 45): "√2/2", ("cos", 60): "1/2",
            ("tan", 30): "√3/3", ("tan", 45): "1", ("tan", 60): "√3",
        }
        ans = table[(fn, angle)]
        pool = ["1/2", "√2/2", "√3/2", "1", "√3", "√3/3"]
        wrongs = [p for p in pool if p != ans][:3]
        stem = f"Without using tables, evaluate $\\{fn} {angle}^\\circ$."
        steps = [
            f"Recall the special angle triangle for ${angle}^\\circ$.",
            f"From SOH-CAH-TOA, $\\{fn} {angle}^\\circ = {ans}$."
        ]
        tip = "Memorize the 30-60-90 and 45-45-90 right triangles for instant JAMB speed."
        ans_sum = ans

    return stem, ans, wrongs, steps, tip, ans_sum


def make_physics_q(idx, lesson_id, body, year, rng):
    variant = idx % 3
    if variant == 0:
        u = rng.choice([0, 2, 4, 5])
        a = rng.choice([2, 3, 4, 5])
        t = rng.choice([3, 4, 5, 6])
        s = u * t + (a * t * t) // 2
        stem = f"A body moves with initial velocity ${u}\\text{{ m/s}}$ and uniform acceleration ${a}\\text{{ m/s}}^2$ for ${t}\\text{{ s}}$. Calculate the distance covered."
        ans = f"{s} m"
        wrongs = [f"{u + a * t} m", f"{s + 10} m", f"{a * t * t} m"]
        if len(set([ans] + wrongs)) < 4:
            wrongs = [f"{s + 5} m", f"{s + 12} m", f"{max(1, s - 4)} m"]
        steps = [
            f"List given values: $u = {u}$, $a = {a}$, $t = {t}$.",
            f"Apply $s = ut + \\frac{{1}}{{2}}at^2 = ({u})({t}) + \\frac{{1}}{{2}}({a})({t}^2) = {s}\\text{{ m}}$."
        ]
        tip = "Check units carefully: velocity is m/s while distance is m."
        return stem, ans, wrongs, steps, tip, ans
    elif variant == 1:
        i_curr = rng.choice([2, 3, 4, 5])
        r_ohm = rng.choice([3, 4, 5, 6, 8])
        v = i_curr * r_ohm
        stem = f"Calculate the potential difference across a ${r_ohm}\\,\\Omega$ resistor carrying a steady current of ${i_curr}\\text{{ A}}$."
        ans = f"{v} V"
        wrongs = [f"{v + 4} V", f"{i_curr + r_ohm} V", f"{max(1, v - 3)} V"]
        steps = [
            "Apply Ohm's Law: $V = I \\times R$.",
            f"$V = {i_curr} \\times {r_ohm} = {v}\\text{{ V}}$."
        ]
        tip = "Use the V-I-R triangle to avoid dividing when you should multiply."
        return stem, ans, wrongs, steps, tip, ans
    else:
        f_hz = rng.choice([50, 100, 200, 250])
        lam = rng.choice([2, 3, 4, 5])
        v = f_hz * lam
        stem = f"A wave of frequency ${f_hz}\\text{{ Hz}}$ has a wavelength of ${lam}\\text{{ m}}$. Find its speed."
        ans = f"{v} m/s"
        wrongs = [f"{f_hz // lam} m/s", f"{v + 50} m/s", f"{f_hz + lam} m/s"]
        steps = [
            "Use the wave equation $v = f\\lambda$.",
            f"$v = {f_hz} \\times {lam} = {v}\\text{{ m/s}}$."
        ]
        tip = "Ensure wavelength is in metres and frequency in Hertz before multiplying."
        return stem, ans, wrongs, steps, tip, ans


def make_chemistry_q(idx, lesson_id, body, year, rng):
    variant = idx % 2
    if variant == 0:
        mol_mass = rng.choice([("CO2", 44), ("H2O", 18), ("CH4", 16), ("NH3", 17), ("O2", 32)])
        n = rng.choice([0.25, 0.5, 1.5, 2.0])
        mass = mol_mass[1] * n
        vol = round(n * 22.4, 2)
        stem = f"Calculate the volume occupied by ${mass}\\text{{ g}}$ of $\\text{{{mol_mass[0]}}}$ at STP. (Molar mass $= {mol_mass[1]}\\text{{ g/mol}}$, G.M.V. $= 22.4\\text{{ dm}}^3$)."
        ans = f"{vol} dm³"
        wrongs = [f"{round(vol * 2, 2)} dm³", f"{round(vol / 2, 2)} dm³", f"{round(vol + 5.6, 2)} dm³"]
        steps = [
            f"Compute moles $n = \\frac{{\\text{{mass}}}}{{\\text{{molar mass}}}} = \\frac{{{mass}}}{{{mol_mass[1]}}} = {n}\\text{{ mol}}$.",
            f"Multiply by molar gas volume at STP: $V = {n} \\times 22.4 = {vol}\\text{{ dm}}^3$."
        ]
        tip = "Always convert grams to moles before multiplying by 22.4 dm³."
        return stem, ans, wrongs, steps, tip, ans
    else:
        c1 = rng.choice([0.1, 0.2, 0.5])
        v1 = rng.choice([20, 25, 40])
        v2 = rng.choice([10, 20, 25])
        c2 = round((c1 * v1) / v2, 3)
        stem = f"In an acid-base titration (1:1 mole ratio), ${v1}\\text{{ cm}}^3$ of ${c1}\\text{{ mol/dm}}^3$ HCl neutralized ${v2}\\text{{ cm}}^3$ of NaOH. Find the concentration of NaOH."
        ans = f"{c2} mol/dm³"
        wrongs = [f"{round(c2 * 2, 3)} mol/dm³", f"{round(c2 / 2, 3)} mol/dm³", f"{round(c2 + 0.1, 3)} mol/dm³"]
        steps = [
            "Use $\\frac{C_a V_a}{C_b V_b} = \\frac{n_a}{n_b} = 1$.",
            f"$C_b = \\frac{{{c1} \\times {v1}}}{{{v2}}} = {c2}\\text{{ mol/dm}}^3$."
        ]
        tip = "Verify the balanced equation ratio ($n_a : n_b$) before substituting."
        return stem, ans, wrongs, steps, tip, ans


def make_economics_q(idx, lesson_id, body, year, rng):
    p_star = rng.randint(4, 12)
    b = rng.randint(2, 5)
    d = rng.randint(2, 5)
    c = rng.randint(5, 15)
    q_star = c + d * p_star
    a = q_star + b * p_star
    stem = f"Given demand $Q_d = {a} - {b}P$ and supply $Q_s = {c} + {d}P$, find the equilibrium price $P^*$ and quantity $Q^*$."
    ans = f"P* = {p_star}, Q* = {q_star}"
    wrongs = [
        f"P* = {p_star + 2}, Q* = {q_star - 4}",
        f"P* = {p_star}, Q* = {q_star + 6}",
        f"P* = {max(1, p_star - 1)}, Q* = {q_star + 2}",
    ]
    steps = [
        f"Equate $Q_d = Q_s$: ${a} - {b}P = {c} + {d}P$.",
        f"Collect like terms: ${a - c} = {b + d}P \\implies P^* = {p_star}$.",
        f"Substitute $P^* = {p_star}$ into $Q_s$: $Q^* = {c} + {d}({p_star}) = {q_star}$."
    ]
    tip = "Plug P* into both Qd and Qs to confirm they give the exact same Q*."
    return stem, ans, wrongs, steps, tip, ans


def make_conceptual_q(code, subj_name, lesson_title, lesson_summary, key_rule, idx, body, year, rng):
    # Rich subject-specific scenario templates across all 33 NERDC subjects
    q_templates = [
        (
            f"[{subj_name} · {lesson_title}] Which principle accurately describes the core rule in {lesson_title}?",
            key_rule,
            [
                f"It ignores {lesson_title.lower()} standards and relies on unverified assumptions",
                f"It reverses the primary relationship taught in {lesson_title}",
                f"It applies only when core variables in {subj_name} are omitted",
            ],
            [
                f"Review the foundational definition of {lesson_title}: {lesson_summary}",
                f"Apply the key rule directly: {key_rule}."
            ],
            f"In {body} {subj_name}, eliminate options that contradict the core rule of {lesson_title}."
        ),
        (
            f"During a {body} {year} {subj_name} assessment on {lesson_title}, a student applies: \"{key_rule}\". Which outcome follows?",
            f"Accurate resolution aligned with NERDC {subj_name} standards for {lesson_title}",
            [
                f"Systematic distortion of {lesson_title} principles",
                f"Loss of validity under standard {body} marking criteria",
                f"Contradiction of established {subj_name} methodology",
            ],
            [
                f"Identify the topic focus: {lesson_title}.",
                f"Confirm that '{key_rule}' is the governing rule in {subj_name}."
            ],
            f"Anchor your answer to the official NERDC objective for {lesson_title}."
        ),
        (
            f"Which of the following is a primary learning objective of {lesson_title} in {subj_name}?",
            lesson_summary,
            [
                f"Memorizing unrelated formulas outside {subj_name}",
                f"Bypassing practical verification in {lesson_title}",
                f"Replacing structured {subj_name} analysis with guesswork",
            ],
            [
                f"Recall the module scope for {lesson_title}.",
                f"The accurate objective is: {lesson_summary}."
            ],
            f"{body} questions test both conceptual recall and practical application of {lesson_title}."
        ),
    ]
    stem, ans, wrongs, steps, tip = q_templates[idx % len(q_templates)]
    return stem, ans, wrongs, steps, tip, ans


def build_pack(code, title, track, level, modules, target_questions, lessons_per_subject=100):
    rng = random.Random(hash(code) & 0xFFFFFFFF)
    pack_id = f"pack_{code.lower()}_full_v1"
    subtopic_angles = [
        "Core Foundations",
        "Key Laws & Definitions",
        "Step-by-Step Worked Examples",
        "Problem-Solving Strategies",
        "Exam Shortcuts & Speed Tricks",
        "Common Pitfalls & Distractor Traps",
        "Applied Real-World Scenarios",
        "Formula & Concept Derivations",
        "Data & Graph Interpretation",
        "Structured Theory Technique",
        "High-Frequency Past Questions",
        "Revision & Mastery Drill",
        "Comparative Analysis",
        "Diagnostic Self-Check",
        "Practical Applications",
        "Multi-Step Synthesis",
        "Timed CBT Readiness",
    ]
    lessons = []
    for i in range(1, lessons_per_subject + 1):
        mod_title, base_title, l_desc = modules[(i - 1) % len(modules)]
        angle = subtopic_angles[(i - 1) // len(modules) % len(subtopic_angles)]
        l_title = f"{base_title}: {angle} ({i})"
        l_id = f"lesson_{code.lower()}_{i}"
        key_rule = f"{base_title} ({angle}): {l_desc}"

        steps = [
            {
                "id": f"step_{code.lower()}_{i}_1",
                "stepOrder": 1,
                "stepType": "concept",
                "contentMarkdown": f"### {l_title}\n{l_desc}\n\n- **Module:** {mod_title}\n- **Focus:** {angle}\n- **Curriculum Level:** {level}"
            },
        ]

        # Add interactive visualizer / oral drill / worked example step
        if code in ("MTH", "FMH") and i % 3 == 1:
            sim_type = ["quadratic_parabola", "unit_circle", "linear_inequality"][i % 3]
            sim_cfg = (
                {"type": "quadratic_parabola", "title": "Interactive Parabola Explorer", "a": 1.0, "b": -3.0, "c": 2.0}
                if sim_type == "quadratic_parabola"
                else (
                    {"type": "unit_circle", "title": "Unit Circle & CAST Quadrants", "angle": 45.0}
                    if sim_type == "unit_circle"
                    else {"type": "linear_inequality", "title": "Inequality Number Line", "k": 2.0}
                )
            )
            steps.append({
                "id": f"step_{code.lower()}_{i}_2",
                "stepOrder": 2,
                "stepType": "interactive_sim",
                "contentMarkdown": f"### Interactive Simulation · {angle}\nAdjust the sliders below to explore how parameters change the solution.",
                "simConfig": sim_cfg,
            })
        elif code == "ECO" and i % 3 == 1:
            steps.append({
                "id": f"step_{code.lower()}_{i}_2",
                "stepOrder": 2,
                "stepType": "interactive_sim",
                "contentMarkdown": "### Interactive Market Equilibrium\nSlide Demand and Supply shifts to see equilibrium $P^*$ and $Q^*$ move.",
                "simConfig": {"type": "supply_demand", "title": "Demand & Supply Equilibrium", "demandShift": 0.0, "supplyShift": 0.0},
            })
        elif code in ("ENG", "NGL", "FRL") and i % 2 == 1:
            steps.append({
                "id": f"step_{code.lower()}_{i}_2",
                "stepOrder": 2,
                "stepType": "oral_drill",
                "contentMarkdown": f"### Audio & Pronunciation Drill · {angle}\nTap **Listen** to hear spoken pronunciation and compare contrasts.",
                "simConfig": {
                    "type": "oral_drill",
                    "items": [
                        {"word": "seat", "ipa": "/siːt/", "contrast": "sit /sɪt/", "rule": "Long vowel /iː/ vs short /ɪ/"},
                        {"word": "EXport (noun)", "ipa": "/ˈekspɔːt/", "contrast": "exPORT (verb)", "rule": "Noun stresses 1st syllable; Verb stresses 2nd"},
                    ],
                },
            })
        else:
            steps.append({
                "id": f"step_{code.lower()}_{i}_2",
                "stepOrder": 2,
                "stepType": "worked_example",
                "contentMarkdown": f"### Interactive Worked Example · {angle}\nReveal each step carefully before checking the final answer.",
                "revealSteps": [
                    f"Identify the governing rule for {base_title}: {l_desc}",
                    f"Apply {angle.lower()} method and verify units/context.",
                    f"Confirm the result against standard {code} marking criteria."
                ],
            })

        steps.append({
            "id": f"step_{code.lower()}_{i}_3",
            "stepOrder": 3,
            "stepType": "checkpoint",
            "contentMarkdown": f"Quick Mastery Check for {l_title}:",
            "checkpointQuestion": {
                "prompt": f"In {base_title} ({angle}), which approach is required?",
                "options": [
                    l_desc,
                    "Ignoring foundational definitions",
                    "Guessing without checking constraints",
                    "None of the above"
                ],
                "correctIndex": 0,
                "explanation": f"Correct! {base_title} requires you to: {l_desc}"
            }
        })

        lessons.append({
            "id": l_id,
            "moduleTitle": mod_title,
            "orderIndex": i,
            "title": l_title,
            "estimatedMinutes": 7 + (i % 5),
            "objectives": [
                l_desc,
                f"Apply {angle.lower()} in {code} WAEC/NECO/JAMB questions"
            ],
            "simpleSummaryMarkdown": f"In simple terms, **{l_title}** helps you {l_desc.lower()} Walk through the interactive steps below, then test yourself on the linked exam questions.",
            "formalSummaryMarkdown": f"Under the NERDC {level} {title} curriculum, **{l_title}** ({mod_title}) requires candidates to {l_desc.lower()}",
            "keyRules": [
                key_rule,
                f"Verify units, context, and {title} conventions before selecting an option"
            ],
            "steps": steps,
        })

    questions = []
    bodies = ["WAEC", "JAMB", "NECO", "BECE", "NCEE"]
    diffs = ["easy", "medium", "hard"]

    for q_idx in range(target_questions):
        lesson = lessons[q_idx % len(lessons)]
        lesson_id = lesson["id"]
        body = bodies[q_idx % len(bodies)] if code in ("MTH", "ENG") else bodies[q_idx % 3]
        year = 2016 + (q_idx % 10)
        paper_type = "theory" if (q_idx % 12 == 0) else ("oral" if (code == "ENG" and q_idx % 5 == 0) else "objective")

        if code in ("MTH", "FMH"):
            stem, ans, wrongs, steps, tip, ans_sum = make_math_q(q_idx, lesson_id, body, year, rng)
        elif code == "PHY":
            stem, ans, wrongs, steps, tip, ans_sum = make_physics_q(q_idx, lesson_id, body, year, rng)
        elif code == "CHM":
            stem, ans, wrongs, steps, tip, ans_sum = make_chemistry_q(q_idx, lesson_id, body, year, rng)
        elif code == "ECO":
            stem, ans, wrongs, steps, tip, ans_sum = make_economics_q(q_idx, lesson_id, body, year, rng)
        else:
            stem, ans, wrongs, steps, tip, ans_sum = make_conceptual_q(
                code, title, lesson["title"], lesson["objectives"][0], lesson["keyRules"][0],
                q_idx, body, year, rng
            )

        correct_idx = q_idx % 4
        opts = list(wrongs[:3])
        opts.insert(correct_idx, ans)

        distractor_notes = {}
        for opt_i in range(4):
            if opt_i != correct_idx:
                distractor_notes[str(opt_i)] = f"Incorrect: '{opts[opt_i]}' does not satisfy the {lesson['title']} condition."

        q_obj = {
            "id": f"q_{code.lower()}_{q_idx + 1}",
            "relatedLessonId": lesson_id,
            "examBody": body,
            "examYear": year,
            "paperType": paper_type,
            "stemMarkdown": f"{stem} *(Set {q_idx + 1})*",
            "options": opts,
            "correctIndex": correct_idx,
            "answerSummary": ans_sum,
            "workedSteps": steps,
            "distractorNotes": distractor_notes,
            "examinerTip": tip,
            "difficulty": diffs[q_idx % 3],
        }
        if paper_type == "theory":
            q_obj["markingPoints"] = [
                f"M1: State the governing rule for {lesson['title']}",
                "A1: Substitute or apply accurate domain steps",
                f"A1: Conclude with exact answer ({ans_sum})",
            ]
        questions.append(q_obj)

    return {
        "id": pack_id,
        "subjectCode": code,
        "title": title,
        "examTrack": track,
        "nerdcLevel": level,
        "version": 1,
        "lessons": lessons,
        "questions": questions,
    }


def main():
    # Clear old starter json files so there are no duplicate/conflicting packs,
    # then generate all 33 NERDC packs totaling exactly 20,000 questions!
    for fname in os.listdir(OUT_DIR):
        if fname.endswith(".json"):
            os.remove(os.path.join(OUT_DIR, fname))

    total_subjects = len(SUBJECTS)  # 33
    base_q = 20000 // total_subjects  # 606
    rem_q = 20000 % total_subjects    # 2

    total_lessons = 0
    total_questions = 0
    for idx, (code, title, track, level, modules) in enumerate(SUBJECTS):
        q_count = base_q + (1 if idx < rem_q else 0)
        pack = build_pack(code, title, track, level, modules, q_count)
        out_path = os.path.join(OUT_DIR, f"pack_{code.lower()}.json")
        with open(out_path, "w", encoding="utf-8") as f:
            json.dump(pack, f, ensure_ascii=False)
        total_lessons += len(pack["lessons"])
        total_questions += len(pack["questions"])

    print(f"Generated {total_subjects} subject packs: {total_lessons} lessons, {total_questions} detailed questions in {OUT_DIR}")


if __name__ == "__main__":
    main()
