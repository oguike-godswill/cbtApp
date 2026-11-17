enum ExamTrack {
  ncee(
    id: 'ncee',
    label: 'Common Entrance',
    shortLabel: 'NCEE',
    level: 'Primary 6',
    description: 'Quantitative, Verbal Reasoning, Maths & English (200-mark scale)',
  ),
  bece(
    id: 'bece',
    label: 'BECE',
    shortLabel: 'BECE',
    level: 'JSS 1–3',
    description: 'Junior Secondary Basic Education Certificate Examination',
  ),
  waecNeco(
    id: 'waec_neco',
    label: 'WAEC / NECO',
    shortLabel: 'WAEC/NECO',
    level: 'SS 1–3',
    description: 'WASSCE & NECO SSCE Objective, Theory Rubrics & A1–F9 Grading',
  ),
  jambUtme(
    id: 'jamb_utme',
    label: 'JAMB UTME',
    shortLabel: 'JAMB',
    level: 'UTME',
    description: '4-Subject CBT Simulator (180 Questions · 120 Mins · 400-Mark Scale)',
  );

  const ExamTrack({
    required this.id,
    required this.label,
    required this.shortLabel,
    required this.level,
    required this.description,
  });

  final String id;
  final String label;
  final String shortLabel;
  final String level;
  final String description;

  Set<String> get allowedSubjectCodes => switch (this) {
        ExamTrack.ncee => const {
            'MTH',
            'ENG',
            'CIV',
            'AGR',
            'ICT',
            'CRS',
            'IRS',
            'NGL',
            'ART',
          },
        ExamTrack.bece => const {
            'MTH',
            'ENG',
            'LIT',
            'CIV',
            'BIO',
            'CHM',
            'PHY',
            'AGR',
            'ICT',
            'HIS',
            'CRS',
            'IRS',
            'ART',
            'MUS',
            'COM',
            'OFP',
            'NGL',
            'FRL',
          },
        ExamTrack.waecNeco => const {
            'MTH', 'ENG', 'LIT', 'CIV',
            'BIO', 'CHM', 'PHY', 'FMH', 'AGR', 'ICT', 'TDR',
            'GOV', 'HIS', 'CRS', 'IRS', 'GEO', 'ART', 'MUS',
            'ECO', 'ACC', 'COM', 'OFP', 'MKT',
            'NGL', 'FRL',
            'DPR', 'CCP', 'GAR', 'PHO', 'ANH', 'FIS', 'AUT', 'ELC',
          },
        ExamTrack.jambUtme => const {
            'MTH', 'ENG', 'LIT',
            'BIO', 'CHM', 'PHY', 'FMH', 'AGR', 'ICT',
            'GOV', 'HIS', 'CRS', 'IRS', 'GEO', 'ART', 'MUS',
            'ECO', 'ACC', 'COM',
            'NGL', 'FRL',
          },
      };

  bool supportsSubject(String subjectCode) =>
      allowedSubjectCodes.contains(subjectCode.toUpperCase());

  static ExamTrack fromId(String id) {
    return ExamTrack.values.firstWhere(
      (e) => e.id == id,
      orElse: () => ExamTrack.waecNeco,
    );
  }
}

enum StudyThemeMode {
  light('light', 'Daylight Paper'),
  dark('dark', 'Night Study'),
  sepia('sepia', 'Sepia Workbook');

  const StudyThemeMode(this.id, this.label);
  final String id;
  final String label;

  static StudyThemeMode fromId(String id) {
    return StudyThemeMode.values.firstWhere(
      (e) => e.id == id,
      orElse: () => StudyThemeMode.light,
    );
  }
}

enum FontScaleOption {
  normal('normal', 'Normal', 1.0),
  large('large', 'Large', 1.15);

  const FontScaleOption(this.id, this.label, this.factor);
  final String id;
  final String label;
  final double factor;

  static FontScaleOption fromId(String id) {
    return FontScaleOption.values.firstWhere(
      (e) => e.id == id,
      orElse: () => FontScaleOption.normal,
    );
  }
}
