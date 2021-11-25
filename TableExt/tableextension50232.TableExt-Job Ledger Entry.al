tableextension 50232 tableextension50232 extends "Job Ledger Entry"
{
    fields
    {

        //Unsupported feature: Code Insertion on ""No."(Field 7)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        if Type = Type::Resource then
          Res.Get("No.");
          Description := Res.Name;
        */
        //end;
        field(50000; "Inventory Posting Group"; Code[10])
        {
            TableRelation = "Inventory Posting Group".Code;
        }
        field(50026; "Old External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(50301; "Marked Rec"; Boolean)
        {
            Description = 'For Voyage P&L Reporting Marked current entrie to be reported, cleared at the end of D Rep.';
        }
        field(50309; "Allocation %"; Decimal)
        {
            Caption = 'Allocation %';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                /*
                "Allocation Quantity" := 0;
                IF "Allocation %" = 0 THEN
                  Amount := 0;
                UpdateAllocations(GenJnlLine);
                */

            end;
        }
        field(50314; "Ending Date"; Date)
        {
            Caption = 'Ending Date';

            trigger OnValidate()
            begin

                case Type of
                    Type::Resource:
                        begin
                            Validate(Quantity); 
                           // ("Ending Date" - "Starting Date"));
                        end;
                end;
            end;
        }
        field(50315; "Resource Group"; Code[20])
        {
        }
        field(50318; "Ended Voyage"; Boolean)
        {
        }
        field(50321; ROB; Decimal)
        {
        }
        field(50324; "Catch Sea Days"; Decimal)
        {
            Description = 'Total sea day on a day that there is a catch';
        }
        field(50325; GroupSort; Code[15])
        {
            Description = 'Voyage P&L Reporting';
        }
        field(50351; "ROB By"; Code[10])
        {
            Editable = false;
            TableRelation = User;
        }
        field(50352; "Phase Code"; Code[10])
        {
        }
        field(50353; "Task Code"; Code[10])
        {
        }
        field(50355; "Vessel Type"; Option)
        {
            OptionCaption = ' ,Short Voyage ';
            OptionMembers = " ","Short Voyage ";
        }
    }
    keys
    {
       // key(ASLKey1; "Job No.", "Location Code", "Posting Date", "Journal Batch Name", Type, "Gen. Prod. Posting Group", "Task Code")
        //{
          //  SumIndexFields = "Total Price";
        }
        //key(Key2; "Job No.", "Location Code", "Work Type Code")
        {
        }
        key(Key3; "Job No.", "Location Code", GroupSort)
        {
        }
        key(Key4; GroupSort, "Location Code", "Posting Date", "External Document No.")
        {
            SumIndexFields = Quantity;
        }
        key(Key5; "Inventory Posting Group", "Location Code", "Posting Date", "External Document No.")
        {
            SumIndexFields = Quantity;
        }
        key(Key6; Type, "No.", "Location Code", "Posting Date")
        {
        }
    }


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 1)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.ShowDimensionSet("Dimension Set ID",StrSubstNo('%1 %2',TableCaption,"Entry No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //DimMgt.ShowDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2',TABLECAPTION," No"));
    */
    //end;


    //Unsupported feature: Property Modification (Id) on "Job(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Job : 1001;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Job : 1101;
    //Variable type has not been exported.

    var
        "Ending Date": Date;
        "Starting Date": Date;
        Res: Record Resource;
}

