package AdventOfSysMLv2_Lesson08 {
    package SleighDesign {
        private import BaseComponents::*;
        part def SantaSleigh {
            part cargoBay : CargoBay;
            part dashboard : NaughtyNiceDashboard;

            ref item santa;
            abstract ref part reindeer : Entities::Reindeer [9];

            ref part dasher     subsets reindeer [1] { constant attribute redefines noseColor = Color::orange;}
            ref part dancer     subsets reindeer [1] { constant attribute redefines noseColor = Color::yellow;}
            ref part prancer    subsets reindeer [1] { constant attribute redefines noseColor = Color::green;}
            ref part vixen      subsets reindeer [1] { constant attribute redefines noseColor = Color::blue;}
            ref part comet      subsets reindeer [1] { constant attribute redefines noseColor = Color::indigo;}
            ref part cupid      subsets reindeer [1] { constant attribute redefines noseColor = Color::violet;}
            ref part donner     subsets reindeer [1] { constant attribute redefines noseColor = Color::silver;}
            ref part blitzen    subsets reindeer [1] { constant attribute redefines noseColor = Color::gold;}
            ref part rudolph    subsets reindeer [1] {
                constant attribute redefines noseColor = Color::red;
                attribute redefines energyLevel := 200.0;
            }
        }
    }

    package ConfiguredSleigh {
        part def SantaSleigh specializes SleighDesign::SantaSleigh {
            private import MagicalBagVariant::*;
            // private import MagicalCargoBayVariant::*;
            part redefines cargoBay : CargoBay;
        }
    }

    package Entities {
        public import ScalarValues::*;
        part def Reindeer {
            public import Datatypes::Color;
            attribute energyLevel : Real;
            constant attribute noseColor : Color;
        }
    }

    package Datatypes {
        enum def Color {
            enum orange;
            enum yellow;
            enum green;
            enum blue;
            enum indigo;
            enum violet;
            enum silver;
            enum gold;
            enum red;
        }
    }

    package BaseComponents {
        part def NaughtyNiceDashboard;

        abstract part def CargoBay {
            item payload : Bag [*];
        }

        abstract item def Bag {
            item gifts [*];
        }
    }

    package MagicalBagVariant {
        private import BaseComponents::*;

        part def <CargoBay> 'Ordinary Cargo Bay' specializes BaseComponents::CargoBay {
            item redefines payload [0..1] : BottomlessGiftBag;
        }

        item def BottomlessGiftBag specializes Bag {
            item redefines gifts;
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
