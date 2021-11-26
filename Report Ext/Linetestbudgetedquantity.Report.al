report 99910 "Line test budgeted quantity"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Linetestbudgetedquantity.rdlc';

    dataset
    {
        dataitem("Sea Food categories"; "Sea Food categories")
        {
            column(Sea_Food_categories___Sea_food_code_; "Sea food code")
            {
            }
            column(A1; A1)
            {
            }
            column(B; B)
            {
            }
            dataitem("Job catch Default"; "Job catch Default")
            {
                DataItemLink = GroupSort = FIELD ("Sea food code");
                DataItemTableView = SORTING ("No.", GroupSort);
                RequestFilterFields = "No.", GroupSort;
                column(Job_catch_Default__No__; "No.")
                {
                }
                column(Job_catch_Default__Budget_Quantity_; "Budget Quantity")
                {
                }
                column(Job_catch_Default_GroupSort; GroupSort)
                {
                }
                column(TotalFor___FIELDCAPTION__No___; TotalFor + FieldCaption("No."))
                {
                }
                column(Job_catch_Default__Budget_Quantity__Control34; "Budget Quantity")
                {
                }
                column(Job_catch_Default__No__Caption; FieldCaption("No."))
                {
                }
                column(Job_catch_Default_GroupSortCaption; FieldCaption(GroupSort))
                {
                }
                column(Job_catch_Default_Table_Name; "Table Name")
                {
                }
                column(Job_catch_Default_Code; Code)
                {
                }
                column(Job_catch_Default_Pack_Size; "Pack Size")
                {
                }

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo(GroupSort);

                    if not FooterPrinted
                    then
                        LastFieldNo := CurrReport.TotalsCausedBy;
                    CurrReport.ShowOutput := not FooterPrinted;
                    FooterPrinted := true;
                end;
            }
            dataitem("Job Ledger Entry Rep"; "Job Ledger Entry")
            {
                DataItemLink = GroupSort = FIELD ("Sea food code");
                DataItemTableView = SORTING ("Job No.", "Location Code", GroupSort) WHERE ("Location Code" = CONST ('CRM-ASL'), "Job No." = CONST ('J03216'));
                column(COPYSTR_GroupSort_5_; CopyStr(GroupSort, 5))
                {
                }
                column(Qty; Qty)
                {
                }
                column(NairaVal2; NairaVal2)
                {
                }
                column(PrdPrc2; PrdPrc2)
                {
                }
                column(Qty_Control1000000002; Qty)
                {
                }
                column(COPYSTR_GroupSort_5__Control1000000003; CopyStr(GroupSort, 5))
                {
                }
                column(Job_Ledger_Entry_Rep_Entry_No_; "Job Ledger Entry Rep"."Entry No.")
                {
                }
                column(Job_Ledger_Entry_Rep_Job_No_; "Job No.")
                {
                }
                column(Job_Ledger_Entry_Rep_GroupSort; GroupSort)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Qty := Quantity * -1;
                    Itempr.SetRange(Itempr."Item No.", "No.");
                    Itempr.SetRange(Itempr."Starting Date", 0D, "Posting Date");
                    if Itempr.Find('+') then Prc := Itempr."Unit Price" else Prc := 0;
                    PrdPrc2 := Qty * Prc;
                end;

                trigger OnPreDataItem()
                begin
                    "Job catch Default".CopyFilter("Job catch Default"."No.", "Job Ledger Entry Rep"."Job No.");
                    LastFieldNo := FieldNo(GroupSort);
                    CurrReport.CreateTotals(PrdPrc2, NairaVal2, Qty);
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        Job: Record Job;
        Job2: Record Job;
        Itempr: Record "Sales Price";
        CurrExc: Record "Currency Exchange Rate";
        ProdPostGrp: Record "Gen. Product Posting Group";
        InvtPostGrp: Record "Inventory Posting Group";
        JobSetUp: Record "Jobs Setup";
        JBudLnd: Record "Job Ledger Entry";
        Employee: Record Employee;
        Loc: Record Location;
        Coutry: Record "Country/Region";
        GLEntry: Record "G/L Entry";
        Prc: Decimal;
        PrdPrc: Decimal;
        PrdPrc2: Decimal;
        CurrRate: Decimal;
        NairaVal: Decimal;
        NairaVal2: Decimal;
        GPPGDesc: Text[30];
        DataStor: array[15] of Decimal;
        PntStor: array[8] of Decimal;
        ETD: Date;
        ETA: Date;
        ETA2: Date;
        CycleDay: Decimal;
        PortDay: Decimal;
        LostDay: Decimal;
        SeaDay: Decimal;
        FishgDay: Decimal;
        a: Decimal;
        expcnt: Integer;
        PeopleOnVoy: Integer;
        ResCount: Integer;
        TotDirExp: Decimal;
        TotIndirExp: Decimal;
        GrossMarg: Decimal;
        GrossPerct: Decimal;
        NetProfPerct: Decimal;
        TotPrice: Decimal;
        NetProfit: Decimal;
        Qty: Decimal;
        ExpTonnage: Decimal;
        Vess: Text[30];
        A1: Decimal;
        B: Decimal;
}

