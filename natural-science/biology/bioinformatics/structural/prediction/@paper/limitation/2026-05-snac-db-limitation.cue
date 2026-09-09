package limitation

snac_db_limitation: {
  content: """
    - In practice, antibody/nanobody-antigen (Ab/Nb-Ag) modeling still trails
      general protein-protein prediction, which can exploit *coevolutionary
      signals* from *paired multiple sequence alignments* (MSAs) and often
      involves relatively *rigid interfaces*. In contrast,
      *complementarity-determining regions* (CDR loops) are:
      1. *hypervariable*;
      2. *highly flexible*; and
      3. often subject to *conformational rearrangement* upon binding.

      These properties make accurate prediction substantially more challenging;

    - Raw PDB files remain notoriously complex:
      1. chain identifiers vary;
      2. biological assemblies and asymmetric units may be mislabeled or incomplete;
      3. missing residues may be recorded only in headers; and
      4. true binding partners can be obscured by crystal-packing artifacts or
        multi-chain epitopes;

    - SAbDab applies rule-based parsing to extract complexes, but automated
      approaches inevitably miss *edge cases* that require expert structural
      biology judgment;

    - SAbDab's strict focus on antibody/nanobody interactions with
      non-immunoglobulin targets excludes several therapeutically relevant
      complex classes, most notably antibody-nanobody pairs and
      T-cell-receptor-antigen assemblies;
  """
}
