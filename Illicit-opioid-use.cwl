cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  sublingual-illicit-opioid-use---primary:
    run: sublingual-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  illicit-opioid-use-therapmethadone---primary:
    run: illicit-opioid-use-therapmethadone---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: sublingual-illicit-opioid-use---primary/output
  illicit-opioid-use-subutex---primary:
    run: illicit-opioid-use-subutex---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-therapmethadone---primary/output
  weekly-illicit-opioid-use---primary:
    run: weekly-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-subutex---primary/output
  illicit-opioid-use-scale---primary:
    run: illicit-opioid-use-scale---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: weekly-illicit-opioid-use---primary/output
  behavioural-illicit-opioid-use---primary:
    run: behavioural-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-scale---primary/output
  illicit-opioid-use-addiction---primary:
    run: illicit-opioid-use-addiction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: behavioural-illicit-opioid-use---primary/output
  illicit-opioid-use-share---primary:
    run: illicit-opioid-use-share---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-addiction---primary/output
  illicit-opioid-use-injector---primary:
    run: illicit-opioid-use-injector---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-share---primary/output
  illicit-opioid-use-monitoring---primary:
    run: illicit-opioid-use-monitoring---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-injector---primary/output
  illicit-opioid-use-naltrexone---primary:
    run: illicit-opioid-use-naltrexone---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-monitoring---primary/output
  illicit-opioid-use-lofexidine---primary:
    run: illicit-opioid-use-lofexidine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-naltrexone---primary/output
  illicit-opioid-use-groin---primary:
    run: illicit-opioid-use-groin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-lofexidine---primary/output
  illicit-opioid-use-lyophilisate---primary:
    run: illicit-opioid-use-lyophilisate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-groin---primary/output
  illicit-opioid-use-espranor---primary:
    run: illicit-opioid-use-espranor---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-lyophilisate---primary/output
  illicit-opioid-use-poisoning---primary:
    run: illicit-opioid-use-poisoning---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-espranor---primary/output
  illicit-opioid-use-failed---primary:
    run: illicit-opioid-use-failed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-poisoning---primary/output
  illicit-opioid-use-dependence---primary:
    run: illicit-opioid-use-dependence---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-failed---primary/output
  illicit-opioid-use-400microgram---primary:
    run: illicit-opioid-use-400microgram---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-dependence---primary/output
  illicit-opioid-use-substitution---primary:
    run: illicit-opioid-use-substitution---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-400microgram---primary/output
  episodic-illicit-opioid-use---primary:
    run: episodic-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-substitution---primary/output
  illicit-opioid-use-physeptone---primary:
    run: illicit-opioid-use-physeptone---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: episodic-illicit-opioid-use---primary/output
  illicit-opioid-use-diamorphine---primary:
    run: illicit-opioid-use-diamorphine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-physeptone---primary/output
  illicit-opioid-use-injecting---primary:
    run: illicit-opioid-use-injecting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-diamorphine---primary/output
  vpersonal-illicit-opioid-use---primary:
    run: vpersonal-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-injecting---primary/output
  illicit-opioid-use-replacement---primary:
    run: illicit-opioid-use-replacement---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: vpersonal-illicit-opioid-use---primary/output
  illicit-opioid-use-turkey---primary:
    run: illicit-opioid-use-turkey---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-replacement---primary/output
  illicit-opioid-use-combined---primary:
    run: illicit-opioid-use-combined---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule29
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-turkey---primary/output
  illicit-opioid-use-mixture---primary:
    run: illicit-opioid-use-mixture---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule30
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-combined---primary/output
  nondependent-illicit-opioid-use---primary:
    run: nondependent-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule31
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-mixture---primary/output
  illicit-opioid-use-remission---primary:
    run: illicit-opioid-use-remission---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule32
      potentialCases:
        id: potentialCases
        source: nondependent-illicit-opioid-use---primary/output
  illicit-opioid-use-overdose---primary:
    run: illicit-opioid-use-overdose---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule33
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-remission---primary/output
  illicit-opioid-use-unspecified---primary:
    run: illicit-opioid-use-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule34
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-overdose---primary/output
  continuous-illicit-opioid-use---primary:
    run: continuous-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule35
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-unspecified---primary/output
  illicit-opioid-use-maintenance---primary:
    run: illicit-opioid-use-maintenance---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule36
      potentialCases:
        id: potentialCases
        source: continuous-illicit-opioid-use---primary/output
  intravenous-illicit-opioid-use---primary:
    run: intravenous-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule37
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-maintenance---primary/output
  illicit-opioid-use-detoxification---primary:
    run: illicit-opioid-use-detoxification---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule38
      potentialCases:
        id: potentialCases
        source: intravenous-illicit-opioid-use---primary/output
  illicit-opioid-use-heroin---primary:
    run: illicit-opioid-use-heroin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule39
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-detoxification---primary/output
  illicit-opioid-use-opium---primary:
    run: illicit-opioid-use-opium---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule40
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-heroin---primary/output
  accidental-illicit-opioid-use---primary:
    run: accidental-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule41
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-opium---primary/output
  illicit-opioid-use-sharing---primary:
    run: illicit-opioid-use-sharing---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule42
      potentialCases:
        id: potentialCases
        source: accidental-illicit-opioid-use---primary/output
  illicit-opioid-use-suboxone---primary:
    run: illicit-opioid-use-suboxone---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule43
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-sharing---primary/output
  illicit-opioid-use-naloxone---primary:
    run: illicit-opioid-use-naloxone---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule44
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-suboxone---primary/output
  illicit-opioid-use-reaction---primary:
    run: illicit-opioid-use-reaction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule45
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-naloxone---primary/output
  harmful-illicit-opioid-use---primary:
    run: harmful-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule46
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-reaction---primary/output
  previous-illicit-opioid-use---primary:
    run: previous-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule47
      potentialCases:
        id: potentialCases
        source: harmful-illicit-opioid-use---primary/output
  illicit-opioid-use-reinduction---primary:
    run: illicit-opioid-use-reinduction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule48
      potentialCases:
        id: potentialCases
        source: previous-illicit-opioid-use---primary/output
  illicit-opioid-use-opiate---primary:
    run: illicit-opioid-use-opiate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule49
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-reinduction---primary/output
  daily-illicit-opioid-use---primary:
    run: daily-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule50
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-opiate---primary/output
  illicit-opioid-use-infrequent---primary:
    run: illicit-opioid-use-infrequent---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule51
      potentialCases:
        id: potentialCases
        source: daily-illicit-opioid-use---primary/output
  agonist-illicit-opioid-use---primary:
    run: agonist-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule52
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-infrequent---primary/output
  illicit-opioid-use-questionnaire---primary:
    run: illicit-opioid-use-questionnaire---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule53
      potentialCases:
        id: potentialCases
        source: agonist-illicit-opioid-use---primary/output
  illicit-opioid-use-cocaine---primary:
    run: illicit-opioid-use-cocaine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule54
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-questionnaire---primary/output
  illicit-opioid-use---primary:
    run: illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule55
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-cocaine---primary/output
  illicit-opioid-use-substance---primary:
    run: illicit-opioid-use-substance---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule56
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use---primary/output
  illicit-opioid-use-hydrochl---primary:
    run: illicit-opioid-use-hydrochl---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule57
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-substance---primary/output
  illicit-opioid-use-sulphate---primary:
    run: illicit-opioid-use-sulphate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule58
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-hydrochl---primary/output
  illicit-opioid-use-codeine---primary:
    run: illicit-opioid-use-codeine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule59
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-sulphate---primary/output
  illicit-opioid-use-buprenorphine---primary:
    run: illicit-opioid-use-buprenorphine---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule60
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-codeine---primary/output
  illicit-opioid-use-linctus---primary:
    run: illicit-opioid-use-linctus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule61
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-buprenorphine---primary/output
  other-illicit-opioid-use---primary:
    run: other-illicit-opioid-use---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule62
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-linctus---primary/output
  illicit-opioid-use-month---primary:
    run: illicit-opioid-use-month---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule63
      potentialCases:
        id: potentialCases
        source: other-illicit-opioid-use---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule64
      potentialCases:
        id: potentialCases
        source: illicit-opioid-use-month---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
  inputModule29:
    id: inputModule29
    doc: Python implementation unit
    type: File
  inputModule30:
    id: inputModule30
    doc: Python implementation unit
    type: File
  inputModule31:
    id: inputModule31
    doc: Python implementation unit
    type: File
  inputModule32:
    id: inputModule32
    doc: Python implementation unit
    type: File
  inputModule33:
    id: inputModule33
    doc: Python implementation unit
    type: File
  inputModule34:
    id: inputModule34
    doc: Python implementation unit
    type: File
  inputModule35:
    id: inputModule35
    doc: Python implementation unit
    type: File
  inputModule36:
    id: inputModule36
    doc: Python implementation unit
    type: File
  inputModule37:
    id: inputModule37
    doc: Python implementation unit
    type: File
  inputModule38:
    id: inputModule38
    doc: Python implementation unit
    type: File
  inputModule39:
    id: inputModule39
    doc: Python implementation unit
    type: File
  inputModule40:
    id: inputModule40
    doc: Python implementation unit
    type: File
  inputModule41:
    id: inputModule41
    doc: Python implementation unit
    type: File
  inputModule42:
    id: inputModule42
    doc: Python implementation unit
    type: File
  inputModule43:
    id: inputModule43
    doc: Python implementation unit
    type: File
  inputModule44:
    id: inputModule44
    doc: Python implementation unit
    type: File
  inputModule45:
    id: inputModule45
    doc: Python implementation unit
    type: File
  inputModule46:
    id: inputModule46
    doc: Python implementation unit
    type: File
  inputModule47:
    id: inputModule47
    doc: Python implementation unit
    type: File
  inputModule48:
    id: inputModule48
    doc: Python implementation unit
    type: File
  inputModule49:
    id: inputModule49
    doc: Python implementation unit
    type: File
  inputModule50:
    id: inputModule50
    doc: Python implementation unit
    type: File
  inputModule51:
    id: inputModule51
    doc: Python implementation unit
    type: File
  inputModule52:
    id: inputModule52
    doc: Python implementation unit
    type: File
  inputModule53:
    id: inputModule53
    doc: Python implementation unit
    type: File
  inputModule54:
    id: inputModule54
    doc: Python implementation unit
    type: File
  inputModule55:
    id: inputModule55
    doc: Python implementation unit
    type: File
  inputModule56:
    id: inputModule56
    doc: Python implementation unit
    type: File
  inputModule57:
    id: inputModule57
    doc: Python implementation unit
    type: File
  inputModule58:
    id: inputModule58
    doc: Python implementation unit
    type: File
  inputModule59:
    id: inputModule59
    doc: Python implementation unit
    type: File
  inputModule60:
    id: inputModule60
    doc: Python implementation unit
    type: File
  inputModule61:
    id: inputModule61
    doc: Python implementation unit
    type: File
  inputModule62:
    id: inputModule62
    doc: Python implementation unit
    type: File
  inputModule63:
    id: inputModule63
    doc: Python implementation unit
    type: File
  inputModule64:
    id: inputModule64
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
