Alias: GLSCodeSystem = http://glstring.org
Alias: HGNCGeneIdCS = http://www.genenames.org/geneId
Alias: LNC = http://loinc.org

Profile:        MyGenotype
Parent:         Observation
Id:             my-genotype
Title:          "My Genotype Observation"
Description:    "My Genotype profile of Observation"
* code = LNC#84413-4 // Genotype display name
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "slice based on component.code pattern"
* component contains 
    gene-studied 1..1 MS
* component[gene-studied] ^short = "Gene studied [ID]"
* component[gene-studied] ^definition = "A gene targeted for mutation analysis, identified in HUGO Gene Nomenclature Committee (HGNC) notation. The required code is HGNC gene ID. Gene IDs are of the format HGNC:n, where n is a unique number. For example, the HGNC identifier for the HLA-A gene is HGNC:4931. The display text associated with the code should be the HGNC official gene symbol. For example, the official gene symbol for 'major histocompatibility complex, class I, A' is HLA-A."
* component[gene-studied].code = LNC#48018-6  // Gene studied [ID]
* component[gene-studied].value[x] only CodeableConcept
* component[gene-studied].valueCodeableConcept 1..1
* component[gene-studied].valueCodeableConcept from HLAGeneIdVS
* value[x] only CodeableConcept 
* valueCodeableConcept.coding ^slicing.discriminator.type = #value
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.description = "slicing on valueCodeableConcept"
* valueCodeableConcept.coding contains 
    GL 1..1 MS
* valueCodeableConcept.coding[GL] ^short = "GL String Code"
* valueCodeableConcept.coding[GL] ^definition = "The Genotype List String Code code system defines a syntax for using the Genotype List String (GL String) grammar in association with a gene family namespace. The GL String Code is composed of three required fields in a string separated by a “#” character. These fields, in order, are: 1) Gene family namespace, 2) version of the nomenclature, or the date when teh GL String was created, and 3) GL String."
* valueCodeableConcept.coding[GL].system 1..1
* valueCodeableConcept.coding[GL].code 1..1
* valueCodeableConcept.coding[GL].system = "http://glstring.org" (exactly)

Instance:   MyGenotypeExample
InstanceOf: my-genotype
Usage: #example
Title:      "HLA-A Genotype Example (HLA-A*01:01:01:01+HLA-A*01:02)"
Description: "Example of HLA-A genotyping using IMGT/HLA 3.25 nomenclature"
* status = #final
* valueCodeableConcept.coding[GL] = GLSCodeSystem#hla#3.25.0#HLA-A*01:01:01:01+HLA-A*01:02
* component[gene-studied].valueCodeableConcept = HGNCGeneIdCS#HGNC:4931 "HLA-A"

ValueSet:  HLAGeneIdVS
Title: "HLA Gene Name Value Set"
Id: hla-geneid-valueset
Description:  "HLA HGNC GeneIds Valueset"
* HLAGeneIdCS#HGNC:4931   "HLA-A"
* HLAGeneIdCS#HGNC:4932   "HLA-B"
* HLAGeneIdCS#HGNC:4933   "HLA-C"
* HLAGeneIdCS#HGNC:4934   "HLA-DMA" 
* HLAGeneIdCS#HGNC:4935   "HLA-DMB" 
* HLAGeneIdCS#HGNC:4936   "HLA-DOA" 
* HLAGeneIdCS#HGNC:4937   "HLA-DOB" 
* HLAGeneIdCS#HGNC:4938   "HLA-DPA1"
* HLAGeneIdCS#HGNC:4939   "HLA-DPA2"
* HLAGeneIdCS#HGNC:19393  "HLA-DPA3"
* HLAGeneIdCS#HGNC:4940   "HLA-DPB1"
* HLAGeneIdCS#HGNC:4941   "HLA-DPB2"
* HLAGeneIdCS#HGNC:4942   "HLA-DQA1"
* HLAGeneIdCS#HGNC:4943   "HLA-DQA2"
* HLAGeneIdCS#HGNC:4944   "HLA-DQB1"
* HLAGeneIdCS#HGNC:4945   "HLA-DQB2"
* HLAGeneIdCS#HGNC:4946   "HLA-DQB3"
* HLAGeneIdCS#HGNC:4947   "HLA-DRA"
* HLAGeneIdCS#HGNC:4948   "HLA-DRB1"
* HLAGeneIdCS#HGNC:4950   "HLA-DRB2"
* HLAGeneIdCS#HGNC:4951   "HLA-DRB3"
* HLAGeneIdCS#HGNC:4952   "HLA-DRB4"
* HLAGeneIdCS#HGNC:4953   "HLA-DRB5"
* HLAGeneIdCS#HGNC:4954   "HLA-DRB6"
* HLAGeneIdCS#HGNC:4955   "HLA-DRB7"
* HLAGeneIdCS#HGNC:4956   "HLA-DRB8"
* HLAGeneIdCS#HGNC:4957   "HLA-DRB9"
* HLAGeneIdCS#HGNC:4962   "HLA-E"
* HLAGeneIdCS#HGNC:4963   "HLA-F"
* HLAGeneIdCS#HGNC:4964   "HLA-G"
* HLAGeneIdCS#HGNC:4965   "HLA-H"
* HLAGeneIdCS#HGNC:4967   "HLA-J"
* HLAGeneIdCS#HGNC:4969   "HLA-K"
* HLAGeneIdCS#HGNC:4970   "HLA-L"
* HLAGeneIdCS#HGNC:19406  "HLA-N"
* HLAGeneIdCS#HGNC:21196  "HLA-P"
* HLAGeneIdCS#HGNC:19395  "HLA-S"
* HLAGeneIdCS#HGNC:23478  "HLA-T"
* HLAGeneIdCS#HGNC:23477  "HLA-U"
* HLAGeneIdCS#HGNC:23482  "HLA-V"
* HLAGeneIdCS#HGNC:23425  "HLA-W"
* HLAGeneIdCS#HGNC:19385  "HLA-X"
* HLAGeneIdCS#HGNC:33913  "HLA-Y"
* HLAGeneIdCS#HGNC:19394  "HLA-Z"

CodeSystem: GLStringCS
Title: "Genotype List String Code CodeSystem"
Id: glstring-codesystem
Description: "Genotype List String Codesystem used for HLA reporting"
* ^url = "http://glstring.org"
* ^compositional = true
* ^version = "1.0"
* ^status = #active
* ^copyright = "National Marrow Donor Program"
* ^publisher = "NMDP/CIBMTR"
* ^content = #not-present

CodeSystem: HLAGeneIdCS
Title: "HLA HGNC GeneID CodeSystem"
Id: hla-genename-codesystem
Description: "CodeSystem of HLA gene group subset of HGNC GeneId Codesystem"
* ^url = "http://www.genenames.org/geneId"
* ^version = "2020"
* ^status = #active
* ^experimental = false
* ^publisher = "NMDP/CIBMTR"
* ^copyright = "National Human Genome Research Institute (NHGRI)"
* ^content = #fragment
* #HGNC:4931  "HLA-A"     "major histocompatibility complex, class I, A"
* #HGNC:4932  "HLA-B"     "major histocompatibility complex, class I, B"
* #HGNC:4933  "HLA-C"     "major histocompatibility complex, class I, C"
* #HGNC:4934  "HLA-DMA"   "major histocompatibility complex, class II, DM alpha"
* #HGNC:4935  "HLA-DMB"   "major histocompatibility complex, class II, DM beta"
* #HGNC:4936  "HLA-DOA"   "major histocompatibility complex, class II, DO alpha"
* #HGNC:4937  "HLA-DOB"   "major histocompatibility complex, class II, DO beta"
* #HGNC:4938  "HLA-DPA1"  "major histocompatibility complex, class II, DP alpha 1"
* #HGNC:4939  "HLA-DPA2"  "major histocompatibility complex, class II, DP alpha 2 (pseudogene)"
* #HGNC:19393 "HLA-DPA3"  "major histocompatibility complex, class II, DP alpha 3 (pseudogene)"
* #HGNC:4940  "HLA-DPB1"  "major histocompatibility complex, class II, DP beta 1"
* #HGNC:4941  "HLA-DPB2"  "major histocompatibility complex, class II, DP beta 2 (pseudogene)"
* #HGNC:4942  "HLA-DQA1"  "major histocompatibility complex, class II, DQ alpha 1"
* #HGNC:4943  "HLA-DQA2"  "major histocompatibility complex, class II, DQ alpha 2"
* #HGNC:4944  "HLA-DQB1"  "major histocompatibility complex, class II, DQ beta 1"
* #HGNC:4945  "HLA-DQB2"  "major histocompatibility complex, class II, DQ beta 2"
* #HGNC:4946  "HLA-DQB3"  "major histocompatibility complex, class II, DQ beta 3"
* #HGNC:4947  "HLA-DRA"   "major histocompatibility complex, class II, DR alpha"
* #HGNC:4948  "HLA-DRB1"  "major histocompatibility complex, class II, DR beta 1"
* #HGNC:4950  "HLA-DRB2"  "major histocompatibility complex, class II, DR beta 2 (pseudogene)"
* #HGNC:4951  "HLA-DRB3"  "major histocompatibility complex, class II, DR beta 3"
* #HGNC:4952  "HLA-DRB4"  "major histocompatibility complex, class II, DR beta 4"
* #HGNC:4953  "HLA-DRB5"  "major histocompatibility complex, class II, DR beta 5"
* #HGNC:4954  "HLA-DRB6"  "major histocompatibility complex, class II, DR beta 6 (pseudogene)"
* #HGNC:4955  "HLA-DRB7"  "major histocompatibility complex, class II, DR beta 7 (pseudogene)"
* #HGNC:4956  "HLA-DRB8"  "major histocompatibility complex, class II, DR beta 8 (pseudogene)"
* #HGNC:4957  "HLA-DRB9"  "major histocompatibility complex, class II, DR beta 9 (pseudogene)"
* #HGNC:4962  "HLA-E"     "major histocompatibility complex, class I, E"
* #HGNC:4963  "HLA-F"     "major histocompatibility complex, class I, F"
* #HGNC:4964  "HLA-G"     "major histocompatibility complex, class I, G"
* #HGNC:4965  "HLA-H"     "major histocompatibility complex, class I, H (pseudogene)"
* #HGNC:4967  "HLA-J"     "major histocompatibility complex, class I, J (pseudogene)"
* #HGNC:4969  "HLA-K"     "major histocompatibility complex, class I, K (pseudogene)"
* #HGNC:4970  "HLA-L"     "major histocompatibility complex, class I, L (pseudogene)"
* #HGNC:19406 "HLA-N"     "major histocompatibility complex, class I, N (pseudogene)"
* #HGNC:21196 "HLA-P"     "major histocompatibility complex, class I, P (pseudogene)"
* #HGNC:19395 "HLA-S"     "major histocompatibility complex, class I, S (pseudogene)"
* #HGNC:23478 "HLA-T"     "major histocompatibility complex, class I, T (pseudogene)"
* #HGNC:23477 "HLA-U"     "major histocompatibility complex, class I, U (pseudogene)"
* #HGNC:23482 "HLA-V"     "major histocompatibility complex, class I, V (pseudogene)"
* #HGNC:23425 "HLA-W"     "major histocompatibility complex, class I, W (pseudogene)"
* #HGNC:19385 "HLA-X"     "major histocompatibility complex, class I, X (pseudogene)"
* #HGNC:33913 "HLA-Y"     "major histocompatibility complex, class I, Y (pseudogene)"
* #HGNC:19394 "HLA-Z"     "major histocompatibility complex, class I, Z (pseudogene)"
