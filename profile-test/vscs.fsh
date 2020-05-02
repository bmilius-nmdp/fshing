Alias: LNC = http://loinc.org

Profile:        MyGenotype
Parent:         Observation
Id:             my-genotype
Title:          "My Genotype Observation"
Description:    "My Genotype profile of Observation"
* code = LNC#84413-4 // Genotype display name
* derivedFrom ^slicing.discriminator[0].type = #type
* derivedFrom ^slicing.discriminator[0].path = "$this.resolve()"
// * derivedFrom ^slicing.discriminator[0].type = #profile
// * derivedFrom ^slicing.discriminator[0].path = "$this.resolve()"
// * derivedFrom ^slicing.discriminator[0].type = #pattern
// * derivedFrom ^slicing.discriminator[0].path = "resolve().code"
// * derivedFrom ^slicing.discriminator[1].type = #pattern
// * derivedFrom ^slicing.discriminator[1].path = "resolve().coordinateSystem"
* derivedFrom ^slicing.rules = #open
* derivedFrom 0..*
* derivedFrom contains 
      hapobs 0..*  and
      molseq 0..* 
* derivedFrom[molseq] only Reference(MolecularSequence)
* derivedFrom[hapobs] only Reference(my-haplotype)

Profile:        MyHapObs
Parent:         Observation
Id:             my-haplotype
Title:          "My Haplotype Observation"
Description:    "My Haplotype profile of Observation"
* status = #final
* code = LNC#84414-2 // Haplotype display name

Instance:   MyGenotypeExample
InstanceOf: my-genotype
Usage: #example
Title:      "Genotype Example"
Description: "Example of genotyping"
* status = #final
* derivedFrom[molseq] = Reference(MySequenceExample)
* derivedFrom[hapobs] = Reference(MyHaplotypeExample)
// * derivedFrom = Reference(MySequenceExample)
* derivedFrom = Reference(MyImagingStudy)

Instance:   MyHaplotypeExample
InstanceOf: my-haplotype
Usage: #example
Title:      "Haplotype Example"
Description: "Example Haplotype"
* status = #final

Instance: MyImagingStudy
InstanceOf: ImagingStudy
Usage: #example 
Title: "Imaging Study Example"
Description: "Example of Imaging Study"
* status = #unknown
* subject.identifier.value = "123"
* subject.type = "Patient"

Instance: MySequenceExample
InstanceOf: MolecularSequence
Usage: #example
Title: "MolecularSequence Example"
Description: "Example of MolecularSequence"
* coordinateSystem = 0 
* type = #dna  
* observedSeq = "CAGGAGCAGAGGGG"