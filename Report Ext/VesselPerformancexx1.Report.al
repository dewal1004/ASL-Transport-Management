report 61190 "Vessel Performance xx1"
{
    // Job.GETFILTERS
    DefaultLayout = RDLC;
    RDLCLayout = './VesselPerformancexx1.rdlc';


    dataset
    {
        dataitem(Job; Job)
        {
            DataItemTableView = SORTING ("No.");
            RequestFilterFields = "Starting Date", "Ending Date", Vessel, "Fishing Country Code", "No.", Captain;
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Job_GETFILTERS; Job.GetFilters)
            {
            }
            column(Job__No__; "No.")
            {
            }
            column(Job_Vessel; Vessel)
            {
            }
            column(Job__Cycle_Day__Manual__; "Cycle Day (Manual)")
            {
            }
            column(Job__Fishing_Day__Manual__; "Fishing Day (Manual)")
            {
            }
            column(Job__Lost_At_Sea__Manual__; "Lost At Sea (Manual)")
            {
            }
            column(Job__Port_Day__Manual__; "Port Day (Manual)")
            {
            }
            column(FishPer; FishPer)
            {
            }
            column(Job__Fuel_Days_; "Fuel Days")
            {
            }
            column(AGVal; AGVal)
            {
            }
            column(FishPer_Control1000000068; FishPer)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Job__Port_Day__Manual___Control1000000069; "Port Day (Manual)")
            {
            }
            column(Job__Lost_At_Sea__Manual___Control1000000070; "Lost At Sea (Manual)")
            {
            }
            column(Job__Fishing_Day__Manual___Control1000000071; "Fishing Day (Manual)")
            {
            }
            column(Job__Cycle_Day__Manual___Control1000000072; "Cycle Day (Manual)")
            {
            }
            column(Job_Vessel_Control1000000073; Vessel)
            {
            }
            column(ExpVal; ExpVal)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaVal_ExpVal; NairaVal - ExpVal)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaVal; NairaVal)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaValB; NairaValB)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaVal_NairaValB; NairaVal - NairaValB)
            {
                DecimalPlaces = 0 : 0;
            }
            column(AGValTot; AGValTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(AGOPct; AGOPct)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Direct; Direct)
            {
                DecimalPlaces = 0 : 0;
            }
            column(GMargin; GMargin)
            {
                DecimalPlaces = 0 : 0;
            }
            column(GMPct; GMPct)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Indirect; Indirect)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Profit; Profit)
            {
                DecimalPlaces = 0 : 0;
            }
            column(CountN; CountN)
            {
            }
            column(ProfitT; ProfitT)
            {
                DecimalPlaces = 0 : 0;
            }
            column(IndirectT; IndirectT)
            {
                DecimalPlaces = 0 : 0;
            }
            column(GMarginT; GMarginT)
            {
                DecimalPlaces = 0 : 0;
            }
            column(DirectT; DirectT)
            {
                DecimalPlaces = 0 : 0;
            }
            column(AGValTotG; AGValTotG)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaValTot_NairaValBTot; NairaValTot - NairaValBTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaValBTot; NairaValBTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaValTot; NairaValTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaValTot_ExpValTot; NairaValTot - ExpValTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(ExpValTot; ExpValTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPer_Control1000000090; FishPer)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Job__Port_Day__Manual___Control1000000091; "Port Day (Manual)")
            {
            }
            column(Job__Lost_At_Sea__Manual___Control1000000092; "Lost At Sea (Manual)")
            {
            }
            column(Job__Fishing_Day__Manual___Control1000000093; "Fishing Day (Manual)")
            {
            }
            column(Job__Cycle_Day__Manual___Control1000000096; "Cycle Day (Manual)")
            {
            }
            column(AGOPctT; AGOPctT)
            {
                DecimalPlaces = 0 : 0;
            }
            column(GMPctT; GMPctT)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPerAvg; FishPerAvg)
            {
                DecimalPlaces = 0 : 0;
            }
            column(AGOPctTAvg; AGOPctTAvg)
            {
                DecimalPlaces = 0 : 0;
            }
            column(GMPctTAvg; GMPctTAvg)
            {
                DecimalPlaces = 0 : 0;
            }
            column(VESSEL_PERFORMANCE_ANALYSISCaption; VESSEL_PERFORMANCE_ANALYSISCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(VESS_Caption; VESS_CaptionLbl)
            {
            }
            column(Job__Cycle_Day__Manual__Caption; Job__Cycle_Day__Manual__CaptionLbl)
            {
            }
            column(Job__Fishing_Day__Manual__Caption; Job__Fishing_Day__Manual__CaptionLbl)
            {
            }
            column(Job__Lost_At_Sea__Manual__Caption; Job__Lost_At_Sea__Manual__CaptionLbl)
            {
            }
            column(Job__Port_Day__Manual__Caption; Job__Port_Day__Manual__CaptionLbl)
            {
            }
            column(FishPerCaption; FishPerCaptionLbl)
            {
            }
            column(NairaVal_ExpValCaption; NairaVal_ExpValCaptionLbl)
            {
            }
            column(NairaValCaption; NairaValCaptionLbl)
            {
            }
            column(NairaValBCaption; NairaValBCaptionLbl)
            {
            }
            column(NairaVal_NairaValBCaption; NairaVal_NairaValBCaptionLbl)
            {
            }
            column(AGValTotCaption; AGValTotCaptionLbl)
            {
            }
            column(AGOPctCaption; AGOPctCaptionLbl)
            {
            }
            column(DirectCaption; DirectCaptionLbl)
            {
            }
            column(GMarginCaption; GMarginCaptionLbl)
            {
            }
            column(GMPctCaption; GMPctCaptionLbl)
            {
            }
            column(IndirectCaption; IndirectCaptionLbl)
            {
            }
            column(ProfitCaption; ProfitCaptionLbl)
            {
            }
            column(ExpValCaption; ExpValCaptionLbl)
            {
            }
            column(CountNCaption; CountNCaptionLbl)
            {
            }
            dataitem("<Job Ledger Entry>"; "Job Ledger Entry")
            {
                DataItemLink = "Job No." = FIELD ("No.");
                DataItemTableView = SORTING ("Job No.", "Location Code", "Work Type Code") WHERE ("Location Code" = CONST ('CRM-ASL'));
                column(Qty; Qty)
                {
                }
                column(Prc; Prc)
                {
                }
                column(PrdPrc; PrdPrc)
                {
                }
                column(NairaVal_Control1000000025; NairaVal)
                {
                }
                column(ExpVal_Control1000000037; ExpVal)
                {
                }
                column(Job_Ledger_Entry___No__; "No.")
                {
                }
                column(NairaVal_ExpVal_Control1000000013; NairaVal - ExpVal)
                {
                }
                column(Prc_Control1000000016; Prc)
                {
                }
                column(Qty_Control1000000019; Qty)
                {
                }
                column(NairaVal_Control1000000028; NairaVal)
                {
                }
                column(PrdPrc_Control1000000022; PrdPrc)
                {
                }
                column(Job_Ledger_Entry___Job_No__; "Job No.")
                {
                }
                column(ExpVal_Control1000000075; ExpVal)
                {
                }
                column(QuantityCaption; QuantityCaptionLbl)
                {
                }
                column(PriceCaption; PriceCaptionLbl)
                {
                }
                column(Product_PriceCaption; Product_PriceCaptionLbl)
                {
                }
                column(Naira_ValueCaption; Naira_ValueCaptionLbl)
                {
                }
                column(Export_ValueCaption; Export_ValueCaptionLbl)
                {
                }
                column(Task_CodeCaption; Task_CodeCaptionLbl)
                {
                }
                column(Job_Ledger_Entry___No__Caption; FieldCaption("No."))
                {
                }
                column(Job_Ledger_Entry__Entry_No_; "Entry No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    /*Qty:=Quantity*-1;
                    Itempr.SETRANGE(Itempr."Item No.","No.");
                    Itempr.SETRANGE(Itempr."Starting Date",0D,"Posting Date");
                    IF Itempr.FIND('+') THEN Prc:=Itempr."Unit Price"
                    ELSE
                    BEGIN
                      Prc:=0;
                      IF Flag THEN MESSAGE('Price Missing for Item %1',"No.");
                    END;
                    PrdPrc:=Qty*Prc;
                    
                    IF Itempr."Currency Code"<>'' THEN
                    BEGIN
                      NairaVal:=PrdPrc*CurrRate;
                    END
                    ELSE
                    BEGIN
                      NairaVal:=PrdPrc*1;
                      IF "Task Code"<>JobSetup."Export Prouct Code" THEN
                         PrdPrc:=0; //Will turn the value to Zero for Non Shrimp product
                    END;
                    
                    IF "Task Code"=JobSetup."Export Prouct Code" THEN ExpVal:=NairaVal;
                    NairaValTot:=NairaValTot+NairaVal;
                    ExpValTot:=ExpValTot+ExpVal;
                    
                    Cost;*///#dik

                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(PrdPrc, NairaVal, ExpVal, Qty);
                end;
            }
            dataitem("Job catch Default"; "Job catch Default")
            {
                DataItemLink = "No." = FIELD ("No.");
                column(NairaValB_Control1000000032; NairaValB)
                {
                }
                column(NairaValB_Control1000000035; NairaValB)
                {
                }
                column(Job_catch_Default_Table_Name; "Table Name")
                {
                }
                column(Job_catch_Default_No_; "No.")
                {
                }
                column(Job_catch_Default_Code; Code)
                {
                }
                column(Job_catch_Default_Pack_Size; "Pack Size")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Syntesis(Code, "Pack Size", Brand); //Compose No.
                    QtyB := "Budget Quantity";
                    Itempr.SetRange(Itempr."Item No.", "No.B");
                    Itempr.SetRange(Itempr."Starting Date", 0D, ETA[1]);
                    if Itempr.Find('+') then PrcB := Itempr."Unit Price" else PrcB := 0;
                    PrdPrcB := QtyB * PrcB;

                    if Itempr."Currency Code" <> '' then begin
                        PrdPrcB := QtyB * PrcB;
                        NairaValB := PrdPrcB * CurrRate
                    end
                    else begin
                        NairaValB := QtyB * PrcB;
                        PrdPrcB := 0;
                    end;
                    NairaValBTot := NairaValBTot + NairaValB;
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(PrdPrcB, NairaValB, QtyB);
                end;
            }
            dataitem("Value Entry"; "Value Entry")
            {
                DataItemLink = "Document No." = FIELD ("No.");
                DataItemTableView = SORTING ("Document No.", "Gen. Prod. Posting Group") WHERE ("Gen. Prod. Posting Group" = FILTER (<> 'FIS'));
                column(AGVal_Control1000000098; AGVal)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Value_Entry__Gen__Prod__Posting_Group_; "Gen. Prod. Posting Group")
                {
                }
                column(Value_Entry__Gen__Prod__Posting_Group__Control1000000100; "Gen. Prod. Posting Group")
                {
                }
                column(AGVal_Control1000000101; AGVal)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Cost_Posted_to_G_L_; -"Cost Posted to G/L")
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Cost_Posted_to_G_L__Control1000000066; -"Cost Posted to G/L")
                {
                    DecimalPlaces = 0 : 0;
                }
                column(AGValTot_Control1000000067; AGValTot)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Value_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Value_Entry_Document_No_; "Document No.")
                {
                }

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(TotPrice);
                end;
            }
            dataitem("<Value Entry>"; "Integer")
            {
                DataItemTableView = WHERE (Number = CONST (1));
                column(GLStrT; GLStrT)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(ResCount; ResCount)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Value_Entry___Cost_Posted_to_G_L_; "Value Entry"."Cost Posted to G/L")
                {
                }
                column(AGValGL; AGValGL)
                {
                }
                column(Value_Entry__Number; Number)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //Find Total TonnagCurrReport.CREATETOTALSe of Export
                    //Job.SETFILTER(Job."Task Filter",JobSetup."Export Prouct Code"); // Task code functinality Removed from Job Ledger Entry
                    Job.CalcFields(Job."Product Quantity", Job."Points Actual");
                    ExpTonnage := Job."Product Quantity" / 1000;

                    //Cycle Day
                    Job2.Get(Job."No.");
                    Job2.SetRange(Job2.Vessel, Job.Vessel);    //Find last voyage
                    if Job2.Next(-1) <> 0 then
                        ETA[2] := Job2."Ending Date"
                    else begin
                        if Loc.Get(Job.Vessel) then
                            ETA[2] := Loc."Begining ETA"
                        else
                            ETA[2] := WorkDate;
                    end;
                    if Job."Cycle Day (Manual)" <> 0 then
                        CycleDay := Job."Cycle Day (Manual)"
                    else
                        CycleDay := ETA[1] - ETA[2];

                    Job.Validate(Job."Net Incentive Actual");
                    DataStor[3] := Job."Net Incentive Actual";

                    //Calculate the Fixed Salaries
                    JBudLn.SetRange(JBudLn."Job No.", Job."No.");
                    if JBudLn.Find('-') then begin
                        //JBudLn.CALCFIELDS(JBudLn.Counter);
                        //PeopleOnVoy:=JBudLn.Counter;
                    end
                    else
                        PeopleOnVoy := Job."No. of Deck Hands" + 2;
                    DataStor[4] := JobSetup."Fixed Salary Rate" * CycleDay * (PeopleOnVoy);

                    //Travelling Expenses for Expatriate
                    expcnt := 0;
                    repeat
                        Employee.SetCurrentKey(Employee."Resource No.");
                        Employee.SetRange(Employee."Resource No.", JBudLn."No.");
                        Employee.SetFilter(Employee."Country/Region Code", '<>NG');
                        if Employee.Find('-') then expcnt := expcnt + 1;
                        ResCount := ResCount + 1;
                    until JBudLn.Next() = 0;
                    DataStor[5] := JobSetup."Travelling Expenses Rate" * expcnt * CycleDay;

                    //License Fee
                    if Coutry.Get(Job."Fishing Country Code") then
                        DataStor[6] := Coutry."License Fees Rate" * CycleDay
                    else begin
                        DataStor[6] := JobSetup."License Fee Rate" * CycleDay;
                        Coutry.Name := 'Nigeria';
                    end;
                    if Loc.Get(Job.Vessel) then begin
                        DataStor[7] := Loc."Insurance Rate" * CycleDay;
                        DataStor[13] := Loc."Depreciation Rate" * CycleDay;
                        DataStor[14] := Loc."Interest Rate" * CycleDay;
                    end;

                    DataStor[8] := JobSetup.Clearing_Fwrd_NPA * ExpTonnage;
                    DataStor[12] := JobSetup."Shore Overheads" * CycleDay;


                    //Credit from G/L Entry
                    CountGPPG := 0;
                    AGValGL := 0;
                    if ProdPostGrp.Find('-') then
                        repeat
                            CountGPPG := CountGPPG + 1;
                            GLEntry.SetCurrentKey(GLEntry."G/L Account No.", GLEntry."Job No.", GLEntry."Gen. Prod. Posting Group");
                            GLEntry.SetRange(GLEntry."G/L Account No.", JobSetup."Job Val Begin Account", JobSetup."Job Val End Account");
                            GLEntry.SetRange(GLEntry."Job No.", Job."No.");
                            GLEntry.SetRange(GLEntry."Gen. Prod. Posting Group", ProdPostGrp.Code);
                            if GLEntry.Find('-') then
                                repeat
                                    GLStr[CountGPPG] := GLStr[CountGPPG] + GLEntry.Amount;
                                until GLEntry.Next() = 0;
                            if ProdPostGrp.Code = 'AG' then AGValGL := GLStr[CountGPPG];
                            GLStr[CountGPPG] := 0;
                            GLStrT := GLStrT + GLEntry.Amount;
                        until ProdPostGrp.Next() = 0;
                    // MESSAGE('AG VAl GL = %1',AGValGL);
                    CountN := CountN + 1;
                end;

                trigger OnPostDataItem()
                begin
                    //AGValGL:=0;
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals(Direct);
                    CountLp := 15;
                    repeat
                        CurrReport.CreateTotals(DataStor[CountLp]);
                        CountLp := CountLp - 1;
                    until CountLp = 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ETA[1] := "Ending Date";
                CurrExc.SetRange(CurrExc."Currency Code", 'USD');
                CurrExc.SetRange(CurrExc."Starting Date", 0D, ETA[1]);
                if CurrExc.Find('+') then begin
                    CurrRate := CurrExc."Relational Exch. Rate Amount";
                    //MESSAGE('EXCHANGE VALUE IS %1',CurrExc."Relational Exch. Rate Amount")
                end
                else
                    CurrRate := 1;
                CurrReport.CreateTotals("Comsumed Value");
                AGValTot := 0;
            end;

            trigger OnPreDataItem()
            begin
                JobSetup.Get;
                //MESSAGE('Setup Val is %1',JobSetup."Export Prouct Code");
                //CurrReport.CREATETOTALS(AGValGL);
            end;
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
        Itempr: Record "Sales Price";
        JobSetup: Record "Jobs Setup";
        CurrExc: Record "Currency Exchange Rate";
        UOM: Record "Unit of Measure";
        JBudLn: Record "Job Ledger Entry";
        Job2: Record Job;
        Loc: Record Location;
        ProdPostGrp: Record "Gen. Product Posting Group";
        InvtPostGrp: Record "Inventory Posting Group";
        Employee: Record Employee;
        Coutry: Record "Country/Region";
        GLEntry: Record "G/L Entry";
        Res: Record Resource;
        Flag: Boolean;
        PeopleOnVoy: Integer;
        expcnt: Integer;
        ResCount: Integer;
        CountZ: Integer;
        CountGPPG: Integer;
        CountGx: Integer;
        CountLp: Integer;
        CountN: Integer;
        DataStor: array[15] of Decimal;
        GLStr: array[25] of Decimal;
        GLStrT: Decimal;
        FishPer: Decimal;
        FishPerAvg: Decimal;
        Qty: Decimal;
        Prc: Decimal;
        PrdPrc: Decimal;
        NairaVal: Decimal;
        NairaValT: Integer;
        ExpVal: Decimal;
        LocVal: Decimal;
        QtyB: Decimal;
        PrcB: Decimal;
        PrdPrcB: Decimal;
        NairaValB: Decimal;
        CurrRate: Decimal;
        AGOPct: Decimal;
        AGOPctT: Decimal;
        AGOPctTAvg: Decimal;
        GMargin: Decimal;
        GMarginT: Decimal;
        GMPct: Decimal;
        GMPctT: Decimal;
        GMPctTAvg: Decimal;
        Direct: Decimal;
        DirectT: Decimal;
        Indirect: Decimal;
        IndirectT: Decimal;
        TotPrice: Decimal;
        Profit: Decimal;
        ProfitT: Decimal;
        AGVal: Decimal;
        AGValGL: Decimal;
        AGValTot: Decimal;
        AGValTotG: Decimal;
        NairaValTot: Decimal;
        ExpValTot: Decimal;
        LocValTot: Decimal;
        NairaValBTot: Decimal;
        ExpTonnage: Decimal;
        "----": Integer;
        CycleDay: Decimal;
        UOMCd: Code[10];
        "No.B": Code[10];
        ETA: array[2] of Date;
        VESSEL_PERFORMANCE_ANALYSISCaptionLbl: Label 'VESSEL PERFORMANCE ANALYSIS';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        VESS_CaptionLbl: Label 'VESS.';
        Job__Cycle_Day__Manual__CaptionLbl: Label 'CYC';
        Job__Fishing_Day__Manual__CaptionLbl: Label 'FISH';
        Job__Lost_At_Sea__Manual__CaptionLbl: Label 'LOST';
        Job__Port_Day__Manual__CaptionLbl: Label 'PORT';
        FishPerCaptionLbl: Label '% Fish';
        NairaVal_ExpValCaptionLbl: Label 'LOC =N=';
        NairaValCaptionLbl: Label 'REVENUE';
        NairaValBCaptionLbl: Label 'Budget';
        NairaVal_NairaValBCaptionLbl: Label 'VARIANCE';
        AGValTotCaptionLbl: Label 'AGO';
        AGOPctCaptionLbl: Label 'AGO %';
        DirectCaptionLbl: Label 'DIRECT';
        GMarginCaptionLbl: Label 'MARGIN';
        GMPctCaptionLbl: Label 'GM %';
        IndirectCaptionLbl: Label 'INDIRECT';
        ProfitCaptionLbl: Label 'PROFIT';
        ExpValCaptionLbl: Label 'EXP =N=';
        CountNCaptionLbl: Label 'S No.';
        QuantityCaptionLbl: Label 'Quantity';
        PriceCaptionLbl: Label 'Price';
        Product_PriceCaptionLbl: Label 'Product Price';
        Naira_ValueCaptionLbl: Label 'Naira Value';
        Export_ValueCaptionLbl: Label 'Export Value';
        Task_CodeCaptionLbl: Label 'Task Code';

    [Scope('Internal')]
    procedure Syntesis(Cd: Code[10]; Pk: Code[10]; Br: Code[10]) Itemno: Code[10]
    begin
        //Syntesis Item Code Name
        if UOM.Get(Pk) then UOMCd := UOM."Catch Code";  //Get Unit of measure Code
        "No.B" := Format(Cd) + UOMCd + CopyStr(Br, 1, 1);    //Requip Code Name
    end;

    [Scope('Internal')]
    procedure Cost()
    begin
    end;
}

