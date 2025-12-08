package L08_Names {
    package BaseComponents {
        part def NaughtyNiceDashboard;

        abstract part def CargoBay {
            item payload [*] : Bag;
            // ...
        }

        abstract item def Bag {
            item gifts [*];
            // ...
        }
    }

    package MagicalBagVariant {
        private import BaseComponents::*;

        part def <CargoBay> 'Ordinary Cargo Bay' specializes BaseComponents::CargoBay {
            // ...
        }


        item def BottomlessGiftBag specializes Bag {
            // ...
        }
    }

    package MagicalCargoBayVariant {
        private import BaseComponents::*;

        part def 'Magical Cargo Bay' specializes BaseComponents::CargoBay {
            item redefines payload : OrdinaryBag;
        }

        alias CargoBay for 'Magical Cargo Bay';

        item def OrdinaryBag specializes Bag {
            item redefines gifts [100];
        }
    }
}
