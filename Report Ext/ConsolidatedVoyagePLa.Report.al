report 99149 "Consolidated Voyage P&La"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ConsolidatedVoyagePLa.rdlc';

    dataset
    {
        dataitem(Jobss; Job)
        {
            DataItemTableView = SORTING (Vessel, "Starting Date");
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
            column(GETFILTERS__; GetFilters())
            {
            }
            column(Text27; Text27)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Text26; Text26)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Text25; Text25)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Text24; Text24)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Text23; Text23)
            {
            }
            column(Text22; Text22)
            {
            }
            column(Text21; Text21)
            {
            }
            column(Jobss_Vessel; Vessel)
            {
            }
            column(PntStor_7_; PntStor[7])
            {
            }
            column(PntStor_6_; PntStor[6])
            {
                DecimalPlaces = 2 : 2;
            }
            column(PntStor_5_; PntStor[5])
            {
            }
            column(PntStor_4_; PntStor[4])
            {
            }
            column(PntStor_3_; PntStor[3])
            {
            }
            column(PntStor_2_; PntStor[2])
            {
            }
            column(PntStor_1_; PntStor[1])
            {
            }
            column(PortDay; PortDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(LostDay; LostDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgDay; FishgDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(CycleDay; CycleDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Jobss__Ending_Date_; "Ending Date")
            {
            }
            column(Jobss__Starting_Date_; "Starting Date")
            {
            }
            column(Jobss__No__; "No.")
            {
            }
            column(PntStor_7__Countrs; PntStor[7] / Countrs)
            {
            }
            column(PntStor_6__Control1000000233; PntStor[6])
            {
                DecimalPlaces = 2 : 2;
            }
            column(PntStor_5__Control1000000234; PntStor[5])
            {
            }
            column(PntStor_4__Control1000000235; PntStor[4])
            {
            }
            column(PntStor_3__Control1000000236; PntStor[3])
            {
            }
            column(PntStor_2__Control1000000237; PntStor[2])
            {
            }
            column(PntStor_1__Control1000000238; PntStor[1])
            {
            }
            column(PortDay_Control1000000239; PortDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(LostDay_Control1000000240; LostDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgDay_Control1000000241; FishgDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(CycleDay_Control1000000242; CycleDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotalFor___FIELDCAPTION_Vessel_; TotalFor + FieldCaption(Vessel))
            {
            }
            column(PntStor_7__Countrs_Control1000000221; PntStor[7] / Countrs)
            {
            }
            column(PntStor_6__Control1000000222; PntStor[6])
            {
                DecimalPlaces = 2 : 2;
            }
            column(PntStor_5__Control1000000223; PntStor[5])
            {
            }
            column(PntStor_4__Control1000000224; PntStor[4])
            {
            }
            column(PntStor_3__Control1000000225; PntStor[3])
            {
            }
            column(PntStor_2__Control1000000226; PntStor[2])
            {
            }
            column(PntStor_1__Control1000000227; PntStor[1])
            {
            }
            column(PortDay_Control1000000228; PortDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(LostDay_Control1000000229; LostDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgDay_Control1000000230; FishgDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(CycleDay_Control1000000231; CycleDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Coutry_Name; Coutry.Name)
            {
            }
            column(Res_Name; Res.Name)
            {
            }
            column(Vess; Vess)
            {
            }
            column(PntStor_1__Control1000000190; PntStor[1])
            {
            }
            column(Text21_Control1000000191; Text21)
            {
            }
            column(PntStor_2__Control1000000192; PntStor[2])
            {
            }
            column(Text22_Control1000000193; Text22)
            {
            }
            column(GETFILTER__No___; GetFilter("No."))
            {
            }
            column(ETDCons; ETDCons)
            {
            }
            column(ETACons; ETACons)
            {
            }
            column(PntStor_3__Control1000000200; PntStor[3])
            {
            }
            column(Text23_Control1000000201; Text23)
            {
            }
            column(CycleDay_Control1000000202; CycleDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(PntStor_4__Control1000000204; PntStor[4])
            {
                DecimalPlaces = 0 : 2;
            }
            column(Text24_Control1000000205; Text24)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgDay_Control1000000206; FishgDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(PntStor_5__Control1000000208; PntStor[5])
            {
                DecimalPlaces = 0 : 2;
            }
            column(Text25_Control1000000209; Text25)
            {
                DecimalPlaces = 0 : 0;
            }
            column(LostDay_Control1000000210; LostDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(PntStor_6__Control1000000212; PntStor[6])
            {
                DecimalPlaces = 0 : 2;
            }
            column(Text26_Control1000000213; Text26)
            {
                DecimalPlaces = 0 : 0;
            }
            column(PntStor_7__Countrs_Control1000000214; PntStor[7] / Countrs)
            {
                DecimalPlaces = 0 : 2;
            }
            column(Text27_Control1000000215; Text27)
            {
                DecimalPlaces = 0 : 0;
            }
            column(PortDay_Control1000000216; PortDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(JobCaption; JobCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Control1000000167Caption; Control1000000167CaptionLbl)
            {
            }
            column(Control1000000168Caption; Control1000000168CaptionLbl)
            {
            }
            column(Control1000000169Caption; Control1000000169CaptionLbl)
            {
            }
            column(Control1000000170Caption; Control1000000170CaptionLbl)
            {
            }
            column(Control1000000171Caption; Control1000000171CaptionLbl)
            {
            }
            column(Control1000000172Caption; Control1000000172CaptionLbl)
            {
            }
            column(Control1000000173Caption; Control1000000173CaptionLbl)
            {
            }
            column(Jobss_VesselCaption; FieldCaption(Vessel))
            {
            }
            column(GETFILTER__No___Caption; GETFILTER__No___CaptionLbl)
            {
            }
            column(ETDConsCaption; ETDConsCaptionLbl)
            {
            }
            column(ETAConsCaption; ETAConsCaptionLbl)
            {
            }
            column(CycleDay_Control1000000202Caption; CycleDay_Control1000000202CaptionLbl)
            {
            }
            column(FishgDay_Control1000000206Caption; FishgDay_Control1000000206CaptionLbl)
            {
            }
            column(LostDay_Control1000000210Caption; LostDay_Control1000000210CaptionLbl)
            {
            }
            column(PortDay_Control1000000216Caption; PortDay_Control1000000216CaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(N_Caption; N_CaptionLbl)
            {
            }
            column(RateCaption; RateCaptionLbl)
            {
            }
            column(Bud__Qty_Caption; Bud__Qty_CaptionLbl)
            {
            }
            column(Bud___Caption; Bud___CaptionLbl)
            {
            }
            column(Bud___N_Caption; Bud___N_CaptionLbl)
            {
            }
            column(Var___N_Caption; Var___N_CaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //VoyageFilter:=COPYSTR(VoyageFilter+"No."+'|',1,1024);


                if Res.Get("Person Responsible") then;
                ETD := "Starting Date";
                ETA := "Ending Date";
                if (ETD <> 0D) and (ETD < ETDCons) then ETDCons := ETD;
                if (ETA <> 0D) and (ETA > ETACons) then ETACons := ETA;

                //Cycle Day
                Job2.Get("No.");
                Job2.SetCurrentKey(Job2.Vessel, Job2."Starting Date");
                Job2.SetRange(Job2.Vessel, Vessel);    //Find last voyage
                                                       //MESSAGE('The Vessel Here is %1',Vessel);
                if Job2.Next(-1) <> 0 then
                    ETA2 := Job2."Ending Date"
                else begin
                    if Loc.Get(Vessel) then ETA2 := Loc."Begining ETA" else ETA2 := 20030101D;
                end;

                if "Cycle Day (Manual)" <> 0 then
                    CycleDay := "Cycle Day (Manual)"
                else
                    CycleDay := ETA - ETA2;

                CalcFields("Lost Days");
                if "Lost At Sea (Manual)" <> 0 then
                    LostDay := "Lost At Sea (Manual)"
                else
                    LostDay := "Lost Days";

                if "Fishing Day (Manual)" <> 0 then
                    FishgDay := "Fishing Day (Manual)"
                else
                    FishgDay := "Sea Days" - LostDay;

                if "Port Day (Manual)" <> 0 then
                    PortDay := "Port Day (Manual)"
                else
                    PortDay := CycleDay - (FishgDay + LostDay);
                SeaDay := FishgDay + LostDay;

                //Find Total Tonnage of Export
                // SETFILTER("Task Filter",'SHR'); //  & u
                CalcFields("Product Quantity", "Points Actual");
                ExpTonnage := "Product Quantity" / 1000;
                PntStor[1] := "Points Actual";

                // SETFILTER("Task Filter",''); // & u
                CalcFields("Points Actual");
                PntStor[3] := "Points Actual";
                PntStor[2] := PntStor[3] - PntStor[1];

                if SeaDay <> 0 then begin
                    PntStor[4] := PntStor[1] / SeaDay;
                    PntStor[5] := PntStor[2] / SeaDay;
                    PntStor[6] := PntStor[3] / SeaDay;
                end;
                Validate("Net Incentive Actual");
                DataStor[3] := "Net Incentive Actual";


                JobSetUp.Get;
                a := 100;

                //Calculate the Fixed Salaries
                JBudLn.SetRange(JBudLn."Job No.", "No.");
                //JBudLn.SETRANGE(JBudLn.Type,JBudLn.Type::Resource);
                if JBudLn.Find('-') then begin
                    JBudLn.CalcFields(JBudLn.Counter);
                    PeopleOnVoy := JBudLn.Counter;
                end
                else
                    PeopleOnVoy := "No. of Deck Hands" + 2;
                DataStor[4] := JobSetUp."Fixed Salary Rate" * CycleDay * (PeopleOnVoy);

                //Travelling Expenses for Expatriate
                repeat
                    Employee.SetCurrentKey(Employee."Resource No.");
                    Employee.SetRange(Employee."Resource No.", JBudLn."No.");
                    Employee.SetFilter(Employee."Country/Region Code", '<>NG');
                    if Employee.Find('-') then expcnt := expcnt + 1;
                    ResCount := ResCount + 1;
                until JBudLn.Next() = 0;
                DataStor[5] := JobSetUp."Travelling Expenses Rate" * expcnt * CycleDay;

                //License Fee
                if Coutry.Get("Bill-to Country/Region Code") then
                    DataStor[6] := Coutry."License Fees Rate" * CycleDay
                else begin
                    DataStor[6] := JobSetUp."License Fee Rate" * CycleDay;
                    Coutry.Name := 'Nigeria';
                end;
                if Loc.Get(Vessel) then begin
                    DataStor[7] := Loc."Insurance Rate" * CycleDay;
                    DataStor[13] := Loc."Depreciation Rate" * CycleDay;
                    DataStor[14] := Loc."Interest Rate" * CycleDay;
                    Vess := Loc.Name;
                end;

                DataStor[8] := JobSetUp.Clearing_Fwrd_NPA * ExpTonnage;
                DataStor[12] := JobSetUp."Shore Overheads" * CycleDay;

                //Credit from G/L Entry
                CountGPPG := 0;
                if ProdPostGrp.Find('-') then
                    repeat
                        CountGPPG := CountGPPG + 1;
                        "GLGPP Caption"[CountGPPG] := ProdPostGrp.Code;
                        GLEntry.SetCurrentKey(GLEntry."G/L Account No.", GLEntry."Job No.", GLEntry."Gen. Prod. Posting Group");
                        GLEntry.SetRange(GLEntry."G/L Account No.", JobSetUp."Job Val Begin Account", JobSetUp."Job Val End Account");
                        GLEntry.SetRange(GLEntry."Job No.", "No.");
                        GLEntry.SetRange(GLEntry."Gen. Prod. Posting Group", ProdPostGrp.Code);
                        if GLEntry.Find('-') then
                            repeat
                                GLStr[CountGPPG] := GLStr[CountGPPG] + GLEntry.Amount;
                            until GLEntry.Next() = 0;
                    until ProdPostGrp.Next() = 0;

                CurrExc.SetRange(CurrExc."Currency Code", 'USD');
                CurrExc.SetRange(CurrExc."Starting Date", 0D, ETA);
                if CurrExc.Find('+') then begin
                    CurrRate := CurrExc."Relational Exch. Rate Amount";
                    //MESSAGE('EXCHANGE VALUE IS %1',CurrExc."Relational Exch. Rate Amount")
                end
                else
                    CurrRate := 1;
                PntStor[7] := CurrRate; //

                if SeaDay <> 0 then begin
                    PntStor[4] := PntStor[1] / SeaDay;
                    PntStor[5] := PntStor[2] / SeaDay;
                    PntStor[6] := PntStor[3] / SeaDay;
                end;
            end;

            trigger OnPostDataItem()
            begin
                if StrLen(VoyageFilter) > 1 then VoyageFilter := CopyStr(VoyageFilter, 1, StrLen(VoyageFilter) - 1);

                if ETDCons = "Period End" then ETDCons := "Period Start";
                if ETACons = "Period Start" then ETACons := "Period End";
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo(Vessel);
                SetRange("Ending Date", "Period Start", "Period End");
                SetFilter("Fishing Country Code", FC);
                SetFilter(Vessel, VesselSel);
                SetFilter("No.", JobsNo);
                SetFilter("Person Responsible", ResourceOn);

                CurrReport.CreateTotals(CycleDay, PortDay, LostDay, SeaDay, FishgDay);
                CurrReport.CreateTotals(PntStor[1], PntStor[2], PntStor[3], PntStor[4], PntStor[5], PntStor[6], PntStor[7]);
                Countrs := Count;
                if Countrs = 0 then Countrs := 1;
                VoyageFilter := '';

                ETDCons := "Period End";
                ETACons := "Period Start";

                if not FooterPrinted then
                    LastFieldNo := CurrReport.TotalsCausedBy;
                CurrReport.ShowOutput := not FooterPrinted;
                FooterPrinted := true;
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total';
        "---": Integer;
        Job: Record Job;
        Job2: Record Job;
        JobRange: Record Job;
        Itempr: Record "Sales Price";
        CurrExc: Record "Currency Exchange Rate";
        ProdPostGrp: Record "Gen. Product Posting Group";
        InvtPostGrp: Record "Inventory Posting Group";
        JobLedgerGrpSort: Record "Job Ledger Entry";
        JobSetUp: Record "Jobs Setup";
        JBudLn: Record "Job Planning Line";
        Employee: Record Employee;
        Loc: Record Location;
        Coutry: Record "Country/Region";
        GLEntry: Record "G/L Entry";
        Res: Record Resource;
        Prc: Decimal;
        PrcB: Decimal;
        PrdPrc: Decimal;
        PrdPrcB: Decimal;
        PrdPrc2: Decimal;
        PrdPrcBX: Decimal;
        PrdPrc2X: Decimal;
        PrdPrc2B: Decimal;
        CurrRate: Decimal;
        NairaVal: Decimal;
        NairaValB: Decimal;
        NairaValBX: Decimal;
        NairaVal2: Decimal;
        NairaVal2X: Decimal;
        NairaVal2B: Decimal;
        Qty: Decimal;
        QtyB: Decimal;
        QtyX: Decimal;
        QtyBX: Decimal;
        GPPGDesc: Text[30];
        DataStor: array[15] of Decimal;
        TotalForX: Label 'Total Exports';
        TotalFory: Label 'Total Local';
        Text03: Label 'Catch Incentive';
        Text04: Label 'Salaries & Wages';
        Text05: Label 'Travelling Expenses';
        Text06: Label 'License Fees';
        Text07: Label 'Insurance';
        Text08: Label 'Clearing & FWRD. & NPA';
        Text09: Label 'Total Direct Expenses';
        PntStor: array[8] of Decimal;
        ETD: Date;
        ETA: Date;
        ETDCons: Date;
        ETACons: Date;
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
        Text10: Label 'Gross Margin';
        Text11: Label '% Of Revenue';
        Text12: Label 'Shore Overheads';
        Text13: Label 'Depreciation';
        Text14: Label 'Interest';
        Text15: Label 'Net Profit';
        Text17: Label 'Total Indirect Expenses';
        TotDirExp: Decimal;
        TotIndirExp: Decimal;
        GrossMarg: Decimal;
        GrossPerct: Decimal;
        NetProfPerct: Decimal;
        TotPrice: Decimal;
        NetProfit: Decimal;
        ExpTonnage: Decimal;
        Vess: Text[30];
        Text18: Label 'VOYAGE PROFIT AND LOSS STATEMENT';
        Text21: Label 'Shrimp Points';
        Text22: Label 'Fish Points';
        Text23: Label 'Total Points';
        Text24: Label 'Avg. Shrimp Points';
        Text25: Label 'Avg. Fish Points';
        Text26: Label 'Avg. Total Points';
        Text27: Label 'Exchange Rate';
        A1: array[5] of Decimal;
        A2: array[5] of Decimal;
        UOM: Record "Unit of Measure";
        UOMCd: Code[10];
        ItemVar: Code[10];
        "No.B": Code[10];
        NOrder: Decimal;
        ValRate: Decimal;
        ValQty: Decimal;
        GLStr: array[25] of Decimal;
        "GLGPP Caption": array[25] of Code[10];
        CountGPPG: Integer;
        CountG: Integer;
        Flag: Boolean;
        "----": Integer;
        "Period Start": Date;
        "Period End": Date;
        FishingCount: Code[30];
        FC: Code[10];
        VesselSel: Code[25];
        JobsNo: Code[250];
        ResourceOn: Code[30];
        VoyageFilter: Code[1024];
        Countrs: Integer;
        JobCaptionLbl: Label 'Job';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Control1000000167CaptionLbl: Label 'Label1000000167';
        Control1000000168CaptionLbl: Label 'Label1000000168';
        Control1000000169CaptionLbl: Label 'Label1000000169';
        Control1000000170CaptionLbl: Label 'Label1000000170';
        Control1000000171CaptionLbl: Label 'Label1000000171';
        Control1000000172CaptionLbl: Label 'Label1000000172';
        Control1000000173CaptionLbl: Label 'Label1000000173';
        GETFILTER__No___CaptionLbl: Label 'Job Filter:';
        ETDConsCaptionLbl: Label 'ETD';
        ETAConsCaptionLbl: Label 'ETA';
        CycleDay_Control1000000202CaptionLbl: Label 'Cycle Day';
        FishgDay_Control1000000206CaptionLbl: Label 'Fishing Day';
        LostDay_Control1000000210CaptionLbl: Label 'Lost At Sea';
        PortDay_Control1000000216CaptionLbl: Label 'Port Day';
        QuantityCaptionLbl: Label 'Quantity';
        EmptyStringCaptionLbl: Label '$';
        N_CaptionLbl: Label '=N=';
        RateCaptionLbl: Label 'Rate';
        Bud__Qty_CaptionLbl: Label 'Bud. Qty.';
        Bud___CaptionLbl: Label 'Bud. $';
        Bud___N_CaptionLbl: Label 'Bud. =N=';
        Var___N_CaptionLbl: Label 'Var. =N=';

    [Scope('Internal')]
    procedure Syntesis(Cd: Code[10]; Pk: Code[10]; Br: Code[10]) Itemno: Code[10]
    begin
        //Syntesis Item Code Name
        if UOM.Get(Pk) then UOMCd := UOM."Catch Code";  //Get Unit of measure Code
        ItemVar := Format(Cd) + UOMCd + CopyStr(Br, 1, 1);    //Requip Code Name
        "No.B" := ItemVar;
    end;

    [Scope('Internal')]
    procedure BIN()
    begin
        /*  //AGO Credit from G/L Entry
          GLEntry.SETCURRENTKEY(GLEntry."G/L Account No.",GLEntry."Job No.",GLEntry."Gen. Prod. Posting Group");
          GLEntry.SETRANGE(GLEntry."G/L Account No.",JobSetUp."AGO Account");
          GLEntry.SETRANGE(GLEntry."Job No.","Job No.");
          GLEntry.SETRANGE(GLEntry."Gen. Prod. Posting Group",JobSetUp."AGO Posting Code");
          IF GLEntry.FIND('-') THEN
          REPEAT
             DataStor[15]:=DataStor[15]+GLEntry.Amount;
          UNTIL GLEntry.NEXT()=0;
        */
        /*IF ("Gen. Prod. Posting Group"=JobSetUp."AGO Posting Code")
          //OR
          // ("Gen. Prod. Posting Group"=JobSetUp."LUB.  Posting Code")
        THEN
        BEGIN
          "Cost Posted to G/L":="Cost Posted to G/L"-DataStor[15];
          ValQty:=-"Valued Quantity"
        END
        ELSE
          ValQty:=0;
        */
        /*LastFieldNo := FIELDNO("Work Type Code");
        CurrReport.CREATETOTALS(PrdPrc,NairaVal,Qty);
        */
        /*Qty:=Quantity*-1;
        Itempr.SETRANGE(Itempr."Item No.","No.");
        Itempr.SETRANGE(Itempr."Starting Date",0D,"Posting Date");
        IF Itempr.FIND('+') THEN Prc:=Itempr."Unit Price" ELSE
        BEGIN
          Prc:=0;
          IF Flag THEN MESSAGE('Price Missing for Item %1',Itempr."Item No.");
        END;
        PrdPrc:=Qty*Prc;
        */
        /*OnPreDataItem()
        //"Job Ledger Entry".COPYFILTER("Job Ledger Entry"."Job No.","Job Ledger Entry Rep"."Job No.");
        //"Job Ledger Entry".COPYFILTER("Job Ledger Entry"."Source Code","Job Ledger Entry Rep"."Source Code");
        //"Job Ledger Entry".COPYFILTER("Job Ledger Entry"."Posting Date","Job Ledger Entry Rep"."Posting Date");
        */
        /*JobRange.SETCURRENTKEY(Vessel,"Starting Date");
        JobRange.SETFILTER(JobRange.Vessel,VesselSel);
        IF JobRange.FIND('-') THEN
        REPEAT
          VoyageFilter:=VoyageFilter+JobRange."No."+'|';
        UNTIL JobRange.NEXT()=0;
        IF STRLEN(VoyageFilter)>1 THEN VoyageFilter:=COPYSTR(VoyageFilter,1,STRLEN(VoyageFilter)-1);
        */

    end;
}

