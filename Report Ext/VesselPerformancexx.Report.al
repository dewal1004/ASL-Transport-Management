report 59191 "Vessel Performance/xx"
{
    DefaultLayout = RDLC;
    RDLCLayout = './VesselPerformancexx.rdlc';

    dataset
    {
        dataitem(Jobss; Job)
        {
            DataItemTableView = SORTING ("Ending Date") WHERE ("Voyage Ended" = CONST (true));
            RequestFilterFields = "No.", "Creation Date";
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
            column(Text18; Text18)
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
            column(ETDCons; ETDCons)
            {
            }
            column(ETACons; ETACons)
            {
            }
            column(SeaRange_20_; SeaRange[20])
            {
            }
            column(SeaRange_19_; SeaRange[19])
            {
            }
            column(SeaRange_18_; SeaRange[18])
            {
            }
            column(SeaRange_17_; SeaRange[17])
            {
            }
            column(SeaRange_16_; SeaRange[16])
            {
            }
            column(SeaRange_15_; SeaRange[15])
            {
            }
            column(SeaRange_14_; SeaRange[14])
            {
            }
            column(SeaRange_13_; SeaRange[13])
            {
            }
            column(SeaRange_12_; SeaRange[12])
            {
            }
            column(SeaRange_11_; SeaRange[11])
            {
            }
            column(SeaRange_10_; SeaRange[10])
            {
            }
            column(SeaRange_9_; SeaRange[9])
            {
            }
            column(SeaRange_8_; SeaRange[8])
            {
            }
            column(SeaRange_7_; SeaRange[7])
            {
            }
            column(SeaRange_6_; SeaRange[6])
            {
            }
            column(SeaRange_5_; SeaRange[5])
            {
            }
            column(SeaRange_4_; SeaRange[4])
            {
            }
            column(SeaRange_3_; SeaRange[3])
            {
            }
            column(SeaRange_2_; SeaRange[2])
            {
            }
            column(SeaRange_1_; SeaRange[1])
            {
                DecimalPlaces = 0 : 0;
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
            column(ActualCaption; ActualCaptionLbl)
            {
            }
            column(BudgetCaption; BudgetCaptionLbl)
            {
            }
            column(ETDConsCaption; ETDConsCaptionLbl)
            {
            }
            column(ETAConsCaption; ETAConsCaptionLbl)
            {
            }
            column(VarianceCaption; VarianceCaptionLbl)
            {
            }
            column(VarianceCaption_Control1000000286; VarianceCaption_Control1000000286Lbl)
            {
            }
            column(ActualCaption_Control1000000445; ActualCaption_Control1000000445Lbl)
            {
            }
            column(BudgetCaption_Control1000000446; BudgetCaption_Control1000000446Lbl)
            {
            }
            column(VarianceCaption_Control1000000447; VarianceCaption_Control1000000447Lbl)
            {
            }
            column(ActualCaption_Control1000000448; ActualCaption_Control1000000448Lbl)
            {
            }
            column(BudgetCaption_Control1000000449; BudgetCaption_Control1000000449Lbl)
            {
            }
            column(VarianceCaption_Control1000000450; VarianceCaption_Control1000000450Lbl)
            {
            }
            column(ActualCaption_Control1000000451; ActualCaption_Control1000000451Lbl)
            {
            }
            column(BudgetCaption_Control1000000452; BudgetCaption_Control1000000452Lbl)
            {
            }
            column(VarianceCaption_Control1000000453; VarianceCaption_Control1000000453Lbl)
            {
            }
            column(ActualCaption_Control1000000454; ActualCaption_Control1000000454Lbl)
            {
            }
            column(BudgetCaption_Control1000000455; BudgetCaption_Control1000000455Lbl)
            {
            }
            column(VarianceCaption_Control1000000456; VarianceCaption_Control1000000456Lbl)
            {
            }
            column(ActualCaption_Control1000000457; ActualCaption_Control1000000457Lbl)
            {
            }
            column(BudgetCaption_Control1000000458; BudgetCaption_Control1000000458Lbl)
            {
            }
            column(VarianceCaption_Control1000000459; VarianceCaption_Control1000000459Lbl)
            {
            }
            column(ActualCaption_Control1000000460; ActualCaption_Control1000000460Lbl)
            {
            }
            column(BudgetCaption_Control1000000461; BudgetCaption_Control1000000461Lbl)
            {
            }
            column(VarianceCaption_Control1000000462; VarianceCaption_Control1000000462Lbl)
            {
            }
            column(ActualCaption_Control1000000463; ActualCaption_Control1000000463Lbl)
            {
            }
            column(BudgetCaption_Control1000000464; BudgetCaption_Control1000000464Lbl)
            {
            }
            column(VarianceCaption_Control1000000465; VarianceCaption_Control1000000465Lbl)
            {
            }
            column(ActualCaption_Control1000000466; ActualCaption_Control1000000466Lbl)
            {
            }
            column(BudgetCaption_Control1000000467; BudgetCaption_Control1000000467Lbl)
            {
            }
            column(VarianceCaption_Control1000000468; VarianceCaption_Control1000000468Lbl)
            {
            }
            column(ActualCaption_Control1000000469; ActualCaption_Control1000000469Lbl)
            {
            }
            column(BudgetCaption_Control1000000470; BudgetCaption_Control1000000470Lbl)
            {
            }
            column(VarianceCaption_Control1000000471; VarianceCaption_Control1000000471Lbl)
            {
            }
            column(ActualCaption_Control1000000472; ActualCaption_Control1000000472Lbl)
            {
            }
            column(BudgetCaption_Control1000000473; BudgetCaption_Control1000000473Lbl)
            {
            }
            column(VarianceCaption_Control1000000474; VarianceCaption_Control1000000474Lbl)
            {
            }
            column(ActualCaption_Control1000000475; ActualCaption_Control1000000475Lbl)
            {
            }
            column(BudgetCaption_Control1000000476; BudgetCaption_Control1000000476Lbl)
            {
            }
            column(VarianceCaption_Control1000000477; VarianceCaption_Control1000000477Lbl)
            {
            }
            column(ActualCaption_Control1000000478; ActualCaption_Control1000000478Lbl)
            {
            }
            column(BudgetCaption_Control1000000479; BudgetCaption_Control1000000479Lbl)
            {
            }
            column(VarianceCaption_Control1000000480; VarianceCaption_Control1000000480Lbl)
            {
            }
            column(ActualCaption_Control1000000481; ActualCaption_Control1000000481Lbl)
            {
            }
            column(BudgetCaption_Control1000000482; BudgetCaption_Control1000000482Lbl)
            {
            }
            column(VarianceCaption_Control1000000483; VarianceCaption_Control1000000483Lbl)
            {
            }
            column(ActualCaption_Control1000000484; ActualCaption_Control1000000484Lbl)
            {
            }
            column(BudgetCaption_Control1000000485; BudgetCaption_Control1000000485Lbl)
            {
            }
            column(VarianceCaption_Control1000000486; VarianceCaption_Control1000000486Lbl)
            {
            }
            column(ActualCaption_Control1000000487; ActualCaption_Control1000000487Lbl)
            {
            }
            column(BudgetCaption_Control1000000488; BudgetCaption_Control1000000488Lbl)
            {
            }
            column(VarianceCaption_Control1000000489; VarianceCaption_Control1000000489Lbl)
            {
            }
            column(ActualCaption_Control1000000490; ActualCaption_Control1000000490Lbl)
            {
            }
            column(BudgetCaption_Control1000000491; BudgetCaption_Control1000000491Lbl)
            {
            }
            column(VarianceCaption_Control1000000492; VarianceCaption_Control1000000492Lbl)
            {
            }
            column(ActualCaption_Control1000000493; ActualCaption_Control1000000493Lbl)
            {
            }
            column(BudgetCaption_Control1000000494; BudgetCaption_Control1000000494Lbl)
            {
            }
            column(VarianceCaption_Control1000000495; VarianceCaption_Control1000000495Lbl)
            {
            }
            column(ActualCaption_Control1000000496; ActualCaption_Control1000000496Lbl)
            {
            }
            column(BudgetCaption_Control1000000497; BudgetCaption_Control1000000497Lbl)
            {
            }
            column(VarianceCaption_Control1000000498; VarianceCaption_Control1000000498Lbl)
            {
            }
            column(ActualCaption_Control1000000499; ActualCaption_Control1000000499Lbl)
            {
            }
            column(BudgetCaption_Control1000000500; BudgetCaption_Control1000000500Lbl)
            {
            }
            column(VarianceCaption_Control1000000504; VarianceCaption_Control1000000504Lbl)
            {
            }
            column(ActualCaption_Control1000000505; ActualCaption_Control1000000505Lbl)
            {
            }
            column(BudgetCaption_Control1000000506; BudgetCaption_Control1000000506Lbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(QuantityCaption_Control1000000308; QuantityCaption_Control1000000308Lbl)
            {
            }
            column(Var___N_Caption; Var___N_CaptionLbl)
            {
            }
            column(Bud___N_Caption; Bud___N_CaptionLbl)
            {
            }
            column(Bud___Caption; Bud___CaptionLbl)
            {
            }
            column(Bud__Qty_Caption; Bud__Qty_CaptionLbl)
            {
            }
            column(RateCaption; RateCaptionLbl)
            {
            }
            column(N_Caption; N_CaptionLbl)
            {
            }
            column(VarianceCaption_Control1000000252; VarianceCaption_Control1000000252Lbl)
            {
            }

            trigger OnAfterGetRecord()
            begin

                Mark(true);
                //VoyageFilter:=COPYSTR(VoyageFilter+"No."+'|',1,1024);
                //VoyageFilter:=VoyageFilter+"No."+'|';
                if (not Mark(true)) then Error('Not Marked');
                ;

                if Res.Get("Person Responsible") then;
                ETD := "Starting Date";
                ETA := "Ending Date";
                if (ETD <> 0D) and (ETD < ETDCons) then ETDCons := ETD;
                if (ETA <> 0D) and (ETA > ETACons) then ETACons := ETA;

                //Cycle Day
                Job2.Get("No.");
                Job2.SetCurrentKey(Job2.Vessel, Job2."Starting Date");
                Job2.SetRange(Job2.Vessel, Vessel);    //Find last voyage
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
                //  SETFILTER("Task Filter",'SHR');//#1
                CalcFields("Product Quantity", "Points Actual");
                ExpTonnage := "Product Quantity" / 1000;
                PntStor[1] := "Points Actual";

                //SETFILTER("Task Filter",'');//#1
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
                    ///JBudLn.CALCFIELDS(JBudLn.Counter);
                    ///PeopleOnVoy:=JBudLn.Counter;
                end
                else
                    PeopleOnVoy := "No. of Deck Hands" + 2;
                DataStor[4] := JobSetUp."Fixed Salary Rate" * CycleDay * (PeopleOnVoy);

                //Travelling Expenses for Expatriate
                expcnt := 0;
                repeat
                    Employee.SetCurrentKey(Employee."Resource No.");
                    Employee.SetRange(Employee."Resource No.", JBudLn."No.");
                    Employee.SetFilter(Employee."Country/Region Code", '<>NG');
                    if Employee.Find('-') then expcnt := expcnt + 1;
                    ResCount := ResCount + 1;
                until JBudLn.Next() = 0;
                expcntTot := expcnt;
                DataStor[5] := JobSetUp."Travelling Expenses Rate" * expcnt * CycleDay;

                //License Fee
                if Coutry.Get("Fishing Country Code") then
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
                PntStor[7] := CurrRate;
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
                CurrReport.CreateTotals(DataStor[3], DataStor[4], DataStor[5], DataStor[6], DataStor[7], DataStor[8], DataStor[9]);
                CurrReport.CreateTotals(DataStor[10], DataStor[11], DataStor[12], DataStor[13], DataStor[14], DataStor[15]);
                CurrReport.CreateTotals(TotDirExp, TotPrice);

                Countrs := Count;
                if Countrs = 0 then Countrs := 1;
                VoyageFilter := '';

                ETDCons := "Period End";
                ETACons := "Period Start";

                //AAA - June 2002
                locate.SetRange(locate."Location Type", 1);
                TotLoc := locate.Count;
                Countx := 2;
                repeat
                    locate.CalcFields(locate."Qty to Cold Room", locate."Qty Budgeted"); //#1
                    if (locate."Qty to Cold Room" <> 0) then begin
                        Message('I am Location %1', locate.Code);
                        SeaRange[Countx] := locate.Code;
                        Countx := Countx + 1;
                    end;
                until locate.Next = 0;
            end;
        }
        dataitem(Jb; Job)
        {
            DataItemTableView = SORTING ("Ending Date");
            column(Jb__No__; "No.")
            {
            }
            column(Jb__Search_Description_; "Search Description")
            {
            }
            column(Jb_Description; Description)
            {
            }
            column(Jb__Description_2_; "Description 2")
            {
            }
            column(Jb__Bill_to_Customer_No__; "Bill-to Customer No.")
            {
            }
            column(Jb__Creation_Date_; "Creation Date")
            {
            }
            column(Jb__No__Caption; FieldCaption("No."))
            {
            }
            column(Jb__Search_Description_Caption; FieldCaption("Search Description"))
            {
            }
            column(Jb_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Jb__Description_2_Caption; FieldCaption("Description 2"))
            {
            }
            column(Jb__Bill_to_Customer_No__Caption; FieldCaption("Bill-to Customer No."))
            {
            }
            column(Jb__Creation_Date_Caption; FieldCaption("Creation Date"))
            {
            }
            dataitem(JbLedMark; "Job Ledger Entry")
            {
                DataItemLink = "Job No." = FIELD ("No.");
                DataItemTableView = SORTING ("Job No.", "Posting Date", Type, "No.", "Location Code", "Gen. Prod. Posting Group") WHERE ("Location Code" = CONST ('CRM-ASL'), "Gen. Prod. Posting Group" = FILTER ('FIS' | ''));
                column(JbLedMark__Job_No__; "Job No.")
                {
                }
                column(JbLedMark__Posting_Date_; "Posting Date")
                {
                }
                column(JbLedMark__Document_No__; "Document No.")
                {
                }
                column(JbLedMark_Type; Type)
                {
                }
                column(JbLedMark__Job_No__Caption; FieldCaption("Job No."))
                {
                }
                column(JbLedMark__Posting_Date_Caption; FieldCaption("Posting Date"))
                {
                }
                column(JbLedMark__Document_No__Caption; FieldCaption("Document No."))
                {
                }
                column(JbLedMark_TypeCaption; FieldCaption(Type))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Marked Rec" := true;
                    Modify;
                end;
            }
            dataitem(JbCatchMark; "Job catch Default")
            {
                DataItemLink = "No." = FIELD ("No.");
                DataItemTableView = SORTING ("No.", GroupSort);
                column(JbCatchMark__Table_Name_; "Table Name")
                {
                }
                column(JbCatchMark__No__; "No.")
                {
                }
                column(JbCatchMark_Code; Code)
                {
                }
                column(JbCatchMark_Description; Description)
                {
                }
                column(JbCatchMark__Pack_Size_; "Pack Size")
                {
                }
                column(JbCatchMark_Brand; Brand)
                {
                }
                column(JbCatchMark__Table_Name_Caption; FieldCaption("Table Name"))
                {
                }
                column(JbCatchMark__No__Caption; FieldCaption("No."))
                {
                }
                column(JbCatchMark_CodeCaption; FieldCaption(Code))
                {
                }
                column(JbCatchMark_DescriptionCaption; FieldCaption(Description))
                {
                }
                column(JbCatchMark__Pack_Size_Caption; FieldCaption("Pack Size"))
                {
                }
                column(JbCatchMark_BrandCaption; FieldCaption(Brand))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Marked Rec" := true;
                    Modify;
                end;
            }
            dataitem(ValEntMark; "Value Entry")
            {
                DataItemLink = "Document No." = FIELD ("No.");
                DataItemTableView = SORTING ("Document No.", "Gen. Prod. Posting Group") WHERE ("Gen. Prod. Posting Group" = FILTER (<> 'FIS'));
                column(ValEntMark__Entry_No__; "Entry No.")
                {
                }
                column(ValEntMark__Item_No__; "Item No.")
                {
                }
                column(ValEntMark__Posting_Date_; "Posting Date")
                {
                }
                column(ValEntMark__Item_Ledger_Entry_Type_; "Item Ledger Entry Type")
                {
                }
                column(ValEntMark__Source_No__; "Source No.")
                {
                }
                column(ValEntMark__Document_No__; "Document No.")
                {
                }
                column(ValEntMark__Entry_No__Caption; FieldCaption("Entry No."))
                {
                }
                column(ValEntMark__Item_No__Caption; FieldCaption("Item No."))
                {
                }
                column(ValEntMark__Posting_Date_Caption; FieldCaption("Posting Date"))
                {
                }
                column(ValEntMark__Item_Ledger_Entry_Type_Caption; FieldCaption("Item Ledger Entry Type"))
                {
                }
                column(ValEntMark__Source_No__Caption; FieldCaption("Source No."))
                {
                }
                column(ValEntMark__Document_No__Caption; FieldCaption("Document No."))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Marked Rec" := true;
                    Modify;
                end;
            }

            trigger OnPreDataItem()
            begin
                Copy(Jobss);
                MarkedOnly(true);
            end;
        }
        dataitem("Sea Food categories1"; "Sea Food categories")
        {
            DataItemTableView = SORTING ("Sea food code");
            column(Sea_Food_categories1__Sea_food_code_; "Sea food code")
            {
            }
            column(A2_4_; A2[4])
            {
            }
            column(A2_3_; A2[3])
            {
            }
            column(A2_2_; A2[2])
            {
            }
            column(A2_1_; A2[1])
            {
            }
            column(A1_4__1000; A1[4] * 1000)
            {
            }
            column(A1_3_; A1[3])
            {
            }
            column(A1_2_; A1[2])
            {
            }
            column(A1_1_; A1[1])
            {
            }
            column(COPYSTR___Sea_food_code__5_; CopyStr("Sea food code", 5))
            {
            }
            column(A2_2__Control1000000021; A2[2])
            {
            }
            column(A1_2__Control1000000309; A1[2])
            {
            }
            column(COPYSTR___Sea_food_code__5__Control1000000312; CopyStr("Sea food code", 5))
            {
            }
            column(A1_2__A2_2_; A1[2] - A2[2])
            {
            }
            column(SeaRangeCBud_1_; SeaRangeCBud[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_1_; SeaRangeC[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_1_; SeaRangeCVar[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_2_; SeaRangeCBud[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_2_; SeaRangeC[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_2_; SeaRangeCVar[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_3_; SeaRangeCBud[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_3_; SeaRangeC[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_3_; SeaRangeCVar[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_4_; SeaRangeCBud[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_4_; SeaRangeC[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_4_; SeaRangeCVar[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_5_; SeaRangeCBud[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5_; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_5_; SeaRangeCVar[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_6_; SeaRangeCBud[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6_; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_6_; SeaRangeCVar[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_7_; SeaRangeCBud[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7_; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_7_; SeaRangeCVar[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_8_; SeaRangeCBud[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_8_; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_8_; SeaRangeCVar[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_9_; SeaRangeCBud[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_9_; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_9_; SeaRangeCVar[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_10_; SeaRangeCBud[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_10_; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_10_; SeaRangeCVar[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_11_; SeaRangeCBud[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11_; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_11_; SeaRangeCVar[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_12_; SeaRangeCBud[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_12_; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_12_; SeaRangeCVar[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_13_; SeaRangeCBud[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_13_; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_13_; SeaRangeCVar[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_14_; SeaRangeCBud[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_14_; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_14_; SeaRangeCVar[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_15_; SeaRangeCBud[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_15_; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_15_; SeaRangeCVar[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_16_; SeaRangeCBud[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_16_; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_16_; SeaRangeCVar[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_17_; SeaRangeCBud[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_17_; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_17_; SeaRangeCVar[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_18_; SeaRangeCBud[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18_; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_18_; SeaRangeCVar[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_19_; SeaRangeCBud[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19_; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_19_; SeaRangeCVar[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_20_; SeaRangeCBud[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20_; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_20_; SeaRangeCVar[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PrdPrcBX; PrdPrcBX)
            {
            }
            column(PrdPrcB; PrdPrcB)
            {
            }
            column(PrdPrcB_PrdPrcBX; PrdPrcB - PrdPrcBX)
            {
            }
            column(PrdPrc2X; PrdPrc2X)
            {
            }
            column(PrdPrc2; PrdPrc2)
            {
            }
            column(PrdPrc2_PrdPrc2X; PrdPrc2 - PrdPrc2X)
            {
            }
            column(TotalForX; TotalForX)
            {
            }
            column(TotalFor; TotalFor)
            {
            }
            column(TotalFory; TotalFory)
            {
            }
            column(PrdPrcBX_PrdPrc2X; PrdPrcBX - PrdPrc2X)
            {
            }
            column(PrdPrcB_PrdPrcBX___PrdPrc2_PrdPrc2X_; (PrdPrcB - PrdPrcBX) - (PrdPrc2 - PrdPrc2X))
            {
            }
            column(PrdPrcB_PrdPrc2; PrdPrcB - PrdPrc2)
            {
            }
            column(SeaRangeCBudN_1_; SeaRangeCBudN[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_1_; SeaRangeCN[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_1_; SeaRangeCVarN[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_2_; SeaRangeCBudN[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_2_; SeaRangeCN[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_2_; SeaRangeCVarN[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_3_; SeaRangeCBudN[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_3_; SeaRangeCN[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_3_; SeaRangeCVarN[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_4_; SeaRangeCBudN[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_4_; SeaRangeCN[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_4_; SeaRangeCVarN[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_5_; SeaRangeCBudN[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_5_; SeaRangeCN[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_5_; SeaRangeCVarN[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_6_; SeaRangeCBudN[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_6_; SeaRangeCN[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_6_; SeaRangeCVarN[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_7_; SeaRangeCBudN[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_7_; SeaRangeCN[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_7_; SeaRangeCVarN[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_8_; SeaRangeCBudN[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_8_; SeaRangeCN[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_8_; SeaRangeCVarN[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_9_; SeaRangeCBudN[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_9_; SeaRangeCN[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_9_; SeaRangeCVarN[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_10_; SeaRangeCBudN[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_10_; SeaRangeCN[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_10_; SeaRangeCVarN[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_11_; SeaRangeCBudN[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_11_; SeaRangeCN[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_11_; SeaRangeCVarN[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_12_; SeaRangeCBudN[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_12_; SeaRangeCN[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_12_; SeaRangeCVarN[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_13_; SeaRangeCBudN[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_13_; SeaRangeCN[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_13_; SeaRangeCVarN[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_14_; SeaRangeCBudN[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_14_; SeaRangeCN[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_14_; SeaRangeCVarN[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_15_; SeaRangeCBudN[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_15_; SeaRangeCN[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_15_; SeaRangeCVarN[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_16_; SeaRangeCBudN[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_16_; SeaRangeCN[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_16_; SeaRangeCVarN[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_17_; SeaRangeCBudN[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_17_; SeaRangeCN[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_17_; SeaRangeCVarN[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_18_; SeaRangeCBudN[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_18_; SeaRangeCN[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_18_; SeaRangeCVarN[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_19_; SeaRangeCBudN[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_19_; SeaRangeCN[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_19_; SeaRangeCVarN[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudN_20_; SeaRangeCBudN[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCN_20_; SeaRangeCN[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarN_20_; SeaRangeCVarN[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_1_; SeaRangeCBudX[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_1_; SeaRangeCX[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_1_; SeaRangeCVarX[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_2_; SeaRangeCBudX[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_2_; SeaRangeCX[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_2_; SeaRangeCVarX[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_3_; SeaRangeCBudX[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_3_; SeaRangeCX[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_3_; SeaRangeCVarX[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_4_; SeaRangeCBudX[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_4_; SeaRangeCX[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_4_; SeaRangeCVarX[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_5_; SeaRangeCBudX[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_5_; SeaRangeCX[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_5_; SeaRangeCVarX[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_6_; SeaRangeCBudX[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_6_; SeaRangeCX[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_6_; SeaRangeCVarX[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_7_; SeaRangeCBudX[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_7_; SeaRangeCX[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_7_; SeaRangeCVarX[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_8_; SeaRangeCBudX[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_8_; SeaRangeCX[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_8_; SeaRangeCVarX[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_9_; SeaRangeCBudX[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_9_; SeaRangeCX[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_9_; SeaRangeCVarX[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_10_; SeaRangeCBudX[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_10_; SeaRangeCX[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_10_; SeaRangeCVarX[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_11_; SeaRangeCBudX[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_11_; SeaRangeCX[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_11_; SeaRangeCVarX[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_12_; SeaRangeCBudX[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_12_; SeaRangeCX[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_12_; SeaRangeCVarX[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_13_; SeaRangeCBudX[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_13_; SeaRangeCX[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_13_; SeaRangeCVarX[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_14_; SeaRangeCBudX[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_14_; SeaRangeCX[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_14_; SeaRangeCVarX[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_15_; SeaRangeCBudX[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_15_; SeaRangeCX[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_15_; SeaRangeCVarX[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_16_; SeaRangeCBudX[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_16_; SeaRangeCX[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_16_; SeaRangeCVarX[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_17_; SeaRangeCBudX[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_17_; SeaRangeCX[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_17_; SeaRangeCVarX[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_18_; SeaRangeCBudX[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_18_; SeaRangeCX[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_18_; SeaRangeCVarX[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_19_; SeaRangeCBudX[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_19_; SeaRangeCX[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_19_; SeaRangeCVarX[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudX_20_; SeaRangeCBudX[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCX_20_; SeaRangeCX[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarX_20_; SeaRangeCVarX[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_1_; SeaRangeCBudL[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_1_; SeaRangeCL[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_1_; SeaRangeCVarL[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_2_; SeaRangeCBudL[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_2_; SeaRangeCL[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_2_; SeaRangeCVarL[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_3_; SeaRangeCBudL[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_3_; SeaRangeCL[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_3_; SeaRangeCVarL[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_4_; SeaRangeCBudL[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_4_; SeaRangeCL[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_4_; SeaRangeCVarL[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_5_; SeaRangeCBudL[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_5_; SeaRangeCL[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_5_; SeaRangeCVarL[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_6_; SeaRangeCBudL[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_6_; SeaRangeCL[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_6_; SeaRangeCVarL[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_7_; SeaRangeCBudL[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_7_; SeaRangeCL[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_7_; SeaRangeCVarL[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_8_; SeaRangeCBudL[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_8_; SeaRangeCL[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_8_; SeaRangeCVarL[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_9_; SeaRangeCBudL[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_9_; SeaRangeCL[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_9_; SeaRangeCVarL[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_10_; SeaRangeCBudL[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_10_; SeaRangeCL[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_10_; SeaRangeCVarL[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_11_; SeaRangeCBudL[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_11_; SeaRangeCL[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_11_; SeaRangeCVarL[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_12_; SeaRangeCBudL[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_12_; SeaRangeCL[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_12_; SeaRangeCVarL[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_13_; SeaRangeCBudL[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_13_; SeaRangeCL[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_13_; SeaRangeCVarL[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_14_; SeaRangeCBudL[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_14_; SeaRangeCL[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_14_; SeaRangeCVarL[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_15_; SeaRangeCBudL[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_15_; SeaRangeCL[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_15_; SeaRangeCVarL[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_16_; SeaRangeCBudL[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_16_; SeaRangeCL[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_16_; SeaRangeCVarL[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_17_; SeaRangeCBudL[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_17_; SeaRangeCL[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_17_; SeaRangeCVarL[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_18_; SeaRangeCBudL[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_18_; SeaRangeCL[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_18_; SeaRangeCVarL[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_19_; SeaRangeCBudL[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_19_; SeaRangeCL[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_19_; SeaRangeCVarL[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBudL_20_; SeaRangeCBudL[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCL_20_; SeaRangeCL[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVarL_20_; SeaRangeCVarL[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sea_Food_categories1__Sea_food_code_Caption; FieldCaption("Sea food code"))
            {
            }
            dataitem("Job Ledger Entry1"; "Job Ledger Entry")
            {
                DataItemLink = GroupSort = FIELD ("Sea food code");
                DataItemTableView = SORTING (GroupSort, "Location Code", "Gen. Prod. Posting Group", "Marked Rec") WHERE ("Location Code" = CONST ('CRM-ASL'), "Gen. Prod. Posting Group" = FILTER ('FIS' | ''), "Marked Rec" = CONST (true));
                column(Job_Ledger_Entry1_GroupSort; GroupSort)
                {
                }
                column(Job_Ledger_Entry1__No__; "No.")
                {
                }
                column(NairaVal2; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000195; PrdPrc2)
                {
                }
                column(Qty; Qty)
                {
                }
                column(Job_Ledger_Entry1_GroupSort_Control1000000198; GroupSort)
                {
                }
                column(NairaVal2_Control1000000199; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000253; PrdPrc2)
                {
                }
                column(Qty_Control1000000254; Qty)
                {
                }
                column(COPYSTR_GroupSort_5_; CopyStr(GroupSort, 5))
                {
                }
                column(NairaVal2_Control1000000257; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000258; PrdPrc2)
                {
                }
                column(Qty_Control1000000260; Qty)
                {
                }
                column(TotalFor_Control1000000261; TotalFor)
                {
                }
                column(Job_Ledger_Entry1_Job_No_; "Job No.")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    Qty := Quantity * -1;
                    Itempr.SetRange(Itempr."Item No.", "No.");
                    Itempr1.SetRange(Itempr1."Starting Date", 0D, "Posting Date");
                    if Itempr.Find('+') then
                        Prc := ItemPrice."Unit Price" else begin
                        Prc := 0;
                        // IF Flag THEN MESSAGE('Price Missing for Item %1',Itempr."Item No.");
                        if Flag then Message('Price Missing for Item %1 %2', "No.", "Job No.", Itempr."Item No.");
                    end;
                    PrdPrc := Qty * Prc;

                    /*//Value By Location(Vessel);
                    level:=TotLoc+1;
                    REPEAT
                      IF SeaRange[level]="Job Ledger Entry1"."Source Code" THEN
                        SeaRangeC[level]:=SeaRangeC[level]+PrdPrc;
                      level:=level-1;
                    UNTIL level=0
                    */

                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo(GroupSort);
                    CurrReport.CreateTotals(PrdPrc2, NairaVal2, Qty);
                end;
            }
            dataitem("Job Catch Default1"; "Job catch Default")
            {
                DataItemLink = GroupSort = FIELD ("Sea food code");
                DataItemTableView = SORTING (GroupSort, "Marked Rec") WHERE ("Marked Rec" = CONST (true));
                column(No_B_; "No.B")
                {
                }
                column(NairaValB; NairaValB)
                {
                }
                column(PrdPrcB_Control1000000091; PrdPrcB)
                {
                }
                column(QtyB; QtyB)
                {
                }
                column(Job_Catch_Default1_GroupSort; GroupSort)
                {
                }
                column(Job_Catch_Default1_Table_Name; "Table Name")
                {
                }
                column(Job_Catch_Default1_No_; "No.")
                {
                }
                column(Job_Catch_Default1_Code; Code)
                {
                }
                column(Job_Catch_Default1_Pack_Size; "Pack Size")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    Syntesis(Code, "Pack Size", Brand); //Compose No.
                    QtyB := "Budget Quantity";
                    Itempr.SetRange(Itempr."Item No.", "No.B");

                    if JobETA.Get("No.") then
                        Itempr1.SetRange(Itempr1."Starting Date", 0D, JobETA."Ending Date")
                    else
                        Itempr1.SetRange(Itempr1."Starting Date", 0D, "Period End");

                    if Itempr.Find('+') then PrcB := ItemPrice."Unit Price" else PrcB := 0;
                    PrdPrcB := QtyB * PrcB;

                    //Value By Location(Vessel);
                    level := TotLoc + 1;
                    repeat
                        if SeaRange[level] = "Job Catch Default1".Vessel then
                            SeaRangeCBud[level] := SeaRangeCBud[level] + PrdPrcB;
                        level := level - 1;
                    until level = 0
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo(GroupSort);
                    CurrReport.CreateTotals(PrdPrcB, NairaValB, QtyB);
                end;
            }

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(PrdPrc2, NairaVal2, Qty);
                CurrReport.CreateTotals(PrdPrcB, NairaValB, QtyB);

                A1[1] := 0;
                A1[2] := 0;
                A1[3] := 0;
                A1[4] := 0;
                A2[1] := 0;
                A2[2] := 0;
                A2[3] := 0;
                A2[4] := 0;

                PrdPrcB := 0;
                PrdPrcBX := 0;
                PrdPrc2 := 0;
                PrdPrc2X := 0;

                //Quatity By Location(Vessel);
                level := TotLoc + 1;
                repeat
                    CurrReport.CreateTotals(SeaRangeC[level], SeaRangeCBud[level], SeaRangeCVar[level]);
                    SeaRangeC[level] := 0;
                    SeaRangeCBud[level] := 0;
                    level := level - 1;
                until level = 0;
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

    trigger OnPreReport()
    begin
        "Job led".SetCurrentKey("Job led".GroupSort, "Job led"."Location Code",
                                "Job led"."Gen. Prod. Posting Group", "Job led"."Marked Rec");
        "Job led".SetRange("Job led"."Marked Rec", true);
        "Job led".SetCurrentKey("Job led"."Phase Code");
        if "Job led".Find('-') then
            repeat
                "Job led"."Marked Rec" := false;
                "Job led".Modify;
            until "Job led".Next = 0;
        "Job led".SetRange("Job led"."Marked Rec");


        "job cath".SetCurrentKey("job cath".GroupSort, "job cath"."Marked Rec");
        "job cath".SetRange("job cath"."Marked Rec", true);
        "job cath".SetCurrentKey("job cath"."Table Name", "job cath"."No.");
        if "job cath".Find('-') then
            repeat
                "job cath"."Marked Rec" := false;
                "job cath".Modify;
            until "job cath".Next = 0;
        "job cath".SetRange("job cath"."Marked Rec");

        "Val Ent".SetCurrentKey("Val Ent"."Gen. Prod. Posting Group", "Val Ent"."Document No.", "Val Ent"."Marked Rec");
        "Val Ent".SetRange("Val Ent"."Marked Rec", true);
        "Val Ent".SetCurrentKey("Val Ent"."Entry No.");
        if "Val Ent".Find('-') then
            repeat
                "Val Ent"."Marked Rec" := false;
                "Val Ent".Modify;
            until "Val Ent".Next = 0;
        "Val Ent".SetRange("Val Ent"."Marked Rec");
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total';
        "---": Integer;
        Job: Record Job;
        Job2: Record Job;
        JobRange: Record Job;
        JobETA: Record Job;
        Itempr: Record "Item Ledger Entry";
        Itempr1: Record Item;
        ItemPrice: Record "Sales Price";
        CurrExc: Record "Currency Exchange Rate";
        ProdPostGrp: Record "Gen. Product Posting Group";
        InvtPostGrp: Record "Inventory Posting Group";
        JobLedgerGrpSort: Record "Job Ledger Entry";
        JobSetUp: Record "Jobs Setup";
        JBudLn: Record "Job Ledger Entry";
        Employee1: Record Employee;
        Employee: Record Employee;
        Loc: Record Location;
        Coutry: Record "Country/Region";
        GLEntry: Record "G/L Entry";
        Res: Record Resource;
        "Job led": Record "Job Ledger Entry";
        "job cath": Record "Job catch Default";
        "Val Ent": Record "Value Entry";
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
        expcntTot: Integer;
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
        Text18: Label 'CONSOLIDATED VOYAGE P & L STATEMENT';
        Text21: Label 'Shrimp Points';
        Text22: Label 'Fish Points';
        Text23: Label 'Total Points';
        Text24: Label 'Avg. Shrimp Points';
        Text25: Label 'Avg. Fish Points';
        Text26: Label 'Avg. Total Points';
        Text27: Label 'Exchange Rate';
        A1: array[5] of Decimal;
        A2: array[5] of Decimal;
        B1: array[5] of Decimal;
        B2: array[5] of Decimal;
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
        "----------------": Integer;
        locate: Record Location;
        Countx: Integer;
        level: Integer;
        LocGroup: Integer;
        TotLoc: Integer;
        SeaRangeC: array[100] of Decimal;
        SeaRangeCBud: array[100] of Decimal;
        SeaRangeCVar: array[100] of Decimal;
        T001: Text[80];
        SeaRange: array[100] of Text[30];
        Cat: Code[15];
        StoreC: array[100] of Decimal;
        StoreCBud: array[100] of Decimal;
        StoreCII: array[100] of Decimal;
        StoreCBudII: array[100] of Decimal;
        SeaRangeCX: array[100] of Decimal;
        SeaRangeCBudX: array[100] of Decimal;
        SeaRangeCVarX: array[100] of Decimal;
        SeaRangeCXN: array[100] of Decimal;
        SeaRangeCBudXN: array[100] of Decimal;
        SeaRangeCVarXN: array[100] of Decimal;
        SeaRangeCL: array[100] of Decimal;
        SeaRangeCBudL: array[100] of Decimal;
        SeaRangeCVarL: array[100] of Decimal;
        SeaRangeCN: array[100] of Decimal;
        SeaRangeCBudN: array[100] of Decimal;
        SeaRangeCVarN: array[100] of Decimal;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Control1000000167CaptionLbl: Label 'Label1000000167';
        Control1000000168CaptionLbl: Label 'Label1000000168';
        Control1000000169CaptionLbl: Label 'Label1000000169';
        Control1000000170CaptionLbl: Label 'Label1000000170';
        Control1000000171CaptionLbl: Label 'Label1000000171';
        Control1000000172CaptionLbl: Label 'Label1000000172';
        Control1000000173CaptionLbl: Label 'Label1000000173';
        GETFILTER__No___CaptionLbl: Label 'Job Filter:';
        CycleDay_Control1000000202CaptionLbl: Label 'Cycle Day';
        FishgDay_Control1000000206CaptionLbl: Label 'Fishing Day';
        LostDay_Control1000000210CaptionLbl: Label 'Lost At Sea';
        PortDay_Control1000000216CaptionLbl: Label 'Port Day';
        ActualCaptionLbl: Label 'Actual';
        BudgetCaptionLbl: Label 'Budget';
        ETDConsCaptionLbl: Label 'ETD';
        ETAConsCaptionLbl: Label 'ETA';
        VarianceCaptionLbl: Label 'Variance';
        VarianceCaption_Control1000000286Lbl: Label 'Variance';
        ActualCaption_Control1000000445Lbl: Label 'Actual';
        BudgetCaption_Control1000000446Lbl: Label 'Budget';
        VarianceCaption_Control1000000447Lbl: Label 'Variance';
        ActualCaption_Control1000000448Lbl: Label 'Actual';
        BudgetCaption_Control1000000449Lbl: Label 'Budget';
        VarianceCaption_Control1000000450Lbl: Label 'Variance';
        ActualCaption_Control1000000451Lbl: Label 'Actual';
        BudgetCaption_Control1000000452Lbl: Label 'Budget';
        VarianceCaption_Control1000000453Lbl: Label 'Variance';
        ActualCaption_Control1000000454Lbl: Label 'Actual';
        BudgetCaption_Control1000000455Lbl: Label 'Budget';
        VarianceCaption_Control1000000456Lbl: Label 'Variance';
        ActualCaption_Control1000000457Lbl: Label 'Actual';
        BudgetCaption_Control1000000458Lbl: Label 'Budget';
        VarianceCaption_Control1000000459Lbl: Label 'Variance';
        ActualCaption_Control1000000460Lbl: Label 'Actual';
        BudgetCaption_Control1000000461Lbl: Label 'Budget';
        VarianceCaption_Control1000000462Lbl: Label 'Variance';
        ActualCaption_Control1000000463Lbl: Label 'Actual';
        BudgetCaption_Control1000000464Lbl: Label 'Budget';
        VarianceCaption_Control1000000465Lbl: Label 'Variance';
        ActualCaption_Control1000000466Lbl: Label 'Actual';
        BudgetCaption_Control1000000467Lbl: Label 'Budget';
        VarianceCaption_Control1000000468Lbl: Label 'Variance';
        ActualCaption_Control1000000469Lbl: Label 'Actual';
        BudgetCaption_Control1000000470Lbl: Label 'Budget';
        VarianceCaption_Control1000000471Lbl: Label 'Variance';
        ActualCaption_Control1000000472Lbl: Label 'Actual';
        BudgetCaption_Control1000000473Lbl: Label 'Budget';
        VarianceCaption_Control1000000474Lbl: Label 'Variance';
        ActualCaption_Control1000000475Lbl: Label 'Actual';
        BudgetCaption_Control1000000476Lbl: Label 'Budget';
        VarianceCaption_Control1000000477Lbl: Label 'Variance';
        ActualCaption_Control1000000478Lbl: Label 'Actual';
        BudgetCaption_Control1000000479Lbl: Label 'Budget';
        VarianceCaption_Control1000000480Lbl: Label 'Variance';
        ActualCaption_Control1000000481Lbl: Label 'Actual';
        BudgetCaption_Control1000000482Lbl: Label 'Budget';
        VarianceCaption_Control1000000483Lbl: Label 'Variance';
        ActualCaption_Control1000000484Lbl: Label 'Actual';
        BudgetCaption_Control1000000485Lbl: Label 'Budget';
        VarianceCaption_Control1000000486Lbl: Label 'Variance';
        ActualCaption_Control1000000487Lbl: Label 'Actual';
        BudgetCaption_Control1000000488Lbl: Label 'Budget';
        VarianceCaption_Control1000000489Lbl: Label 'Variance';
        ActualCaption_Control1000000490Lbl: Label 'Actual';
        BudgetCaption_Control1000000491Lbl: Label 'Budget';
        VarianceCaption_Control1000000492Lbl: Label 'Variance';
        ActualCaption_Control1000000493Lbl: Label 'Actual';
        BudgetCaption_Control1000000494Lbl: Label 'Budget';
        VarianceCaption_Control1000000495Lbl: Label 'Variance';
        ActualCaption_Control1000000496Lbl: Label 'Actual';
        BudgetCaption_Control1000000497Lbl: Label 'Budget';
        VarianceCaption_Control1000000498Lbl: Label 'Variance';
        ActualCaption_Control1000000499Lbl: Label 'Actual';
        BudgetCaption_Control1000000500Lbl: Label 'Budget';
        VarianceCaption_Control1000000504Lbl: Label 'Variance';
        ActualCaption_Control1000000505Lbl: Label 'Actual';
        BudgetCaption_Control1000000506Lbl: Label 'Budget';
        QuantityCaptionLbl: Label 'Quantity';
        EmptyStringCaptionLbl: Label '$';
        QuantityCaption_Control1000000308Lbl: Label 'Quantity';
        Var___N_CaptionLbl: Label 'Var. =N=';
        Bud___N_CaptionLbl: Label 'Bud. =N=';
        Bud___CaptionLbl: Label 'Bud. $';
        Bud__Qty_CaptionLbl: Label 'Bud. Qty.';
        RateCaptionLbl: Label 'Rate';
        N_CaptionLbl: Label '=N=';
        VarianceCaption_Control1000000252Lbl: Label 'Variance';

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
    end;
}

