package L22_Requirements {
    package SantaSleighSpecification {
        part def SantaSleigh;
    }
    package UserRequirements {
        requirement def <UR1> DeliverGifts {
            subject sleigh : SantaSleighSpecification::SantaSleigh;
            doc
            /* Santa's sleigh shall be able to deliver gifts to all nice children. */
        }
    }
    package SantaSleighDesign {
        part def SantaSleigh specializes SantaSleighSpecification::SantaSleigh {
            part cockpit;
            part cargoBay : CargoBay;
            ref part santa;
        }

        abstract part def CargoBay {
            item payload : Bag [*];
        }

        abstract item def Bag {
            item gifts [*];
        }
    }

    package RequirementBreakdown {
        private import SantaSleighDesign::*;

        requirement def <TR1> DeliverGifts specializes UserRequirements::DeliverGifts {
            subject redefines sleigh : SantaSleigh;

            requirement : CockpitForSanta; // subject is by default bound to parent requirement's subject
            requirement : CargoCapacity {
                // subject can also be a subcomponent
                subject :>> cargoBay = sleigh.cargoBay;
            }
        }

        requirement def <'TR1.1'> CockpitForSanta {
            subject sleigh : SantaSleigh;
        }

        requirement def <'TR1.2'> CargoCapacity {
            subject cargoBay : CargoBay;
            doc
            /* The cargo bay must be able to accommodate an arbitrary number of gifts. */
        }
    }
}
