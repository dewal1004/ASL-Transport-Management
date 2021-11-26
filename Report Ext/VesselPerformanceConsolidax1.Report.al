report 99191 "Vessel Performance Consolidax1"
{
    // "Period Start":=010103D; "Period End":= 010503D;
    // "Period Start":=CALCDATE('CM-2M+1D',030503D);  "Period End":=CALCDATE('CM-1M',030503D);//020503D;//
    // 
    // A:: Actual B:: Budget C:: Variance
    // SubHdr1A:: Skipper
    // SubHdr2A:: Endurance   VessEndr:: Vessel Endurance
    // SubHdr3A:: ETA
    // SubHdr4A:: Fishing Day
    // SubHdr5A:: Lost at Sea
    // SubHdr6A:: Port Day
    // 
    // Name
    // 
    // CellDefLn :: Cell Definition Line
    // CellDefVT :: Cell Definition Value Totals
    // CellDefHd :: Cell Definition Headers
    DefaultLayout = RDLC;
    RDLCLayout = './VesselPerformanceConsolidax1.rdlc';


    dataset
    {
        dataitem(Jobss; Job)
        {
            DataItemTableView = SORTING ("Ending Date") WHERE ("Voyage Ended" = CONST (true));
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
            column(Text18; Text18)
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
            column(SubHdr6A_5_; SubHdr6A[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr5A_5_; SubHdr5A[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr4A_5_; SubHdr4A[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr3A_5_; SubHdr3A[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr2A_5_; SubHdr2A[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr2A_4_; SubHdr2A[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr3A_4_; SubHdr3A[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr4A_4_; SubHdr4A[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr5A_4_; SubHdr5A[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr6A_4_; SubHdr6A[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr1A_4_; SubHdr1A[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr1A_5_; SubHdr1A[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr1A_3_; SubHdr1A[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr2A_3_; SubHdr2A[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr3A_3_; SubHdr3A[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr4A_3_; SubHdr4A[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr5A_3_; SubHdr5A[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr6A_3_; SubHdr6A[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr1A_2_; SubHdr1A[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr2A_2_; SubHdr2A[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr3A_2_; SubHdr3A[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr5A_2_; SubHdr5A[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr4A_2_; SubHdr4A[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SubHdr6A_2_; SubHdr6A[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PortDay_Control1000000609; PortDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(LostDay_Control1000000611; LostDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgDay_Control1000000613; FishgDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(ETACons; ETACons)
            {
            }
            column(VessEndr; VessEndr)
            {
            }
            column(SeaRange_1_; SeaRange[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(FILTERSCaption; FILTERSCaptionLbl)
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
            column(VarianceCaption; VarianceCaptionLbl)
            {
            }
            column(ActualCaption; ActualCaptionLbl)
            {
            }
            column(BudgetCaption; BudgetCaptionLbl)
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
            column(BudgetCaption_Control1000000249; BudgetCaption_Control1000000249Lbl)
            {
            }
            column(ActualCaption_Control1000000244; ActualCaption_Control1000000244Lbl)
            {
            }
            column(VarianceCaption_Control1000000285; VarianceCaption_Control1000000285Lbl)
            {
            }
            column(VarianceCaption_Control1000000334; VarianceCaption_Control1000000334Lbl)
            {
            }
            column(ActualCaption_Control1000000447; ActualCaption_Control1000000447Lbl)
            {
            }
            column(BudgetCaption_Control1000000448; BudgetCaption_Control1000000448Lbl)
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
            column(VarianceCaption_Control1000000454; VarianceCaption_Control1000000454Lbl)
            {
            }
            column(ActualCaption_Control1000000455; ActualCaption_Control1000000455Lbl)
            {
            }
            column(BudgetCaption_Control1000000621; BudgetCaption_Control1000000621Lbl)
            {
            }
            column(PortDay_Control1000000609Caption; PortDay_Control1000000609CaptionLbl)
            {
            }
            column(LostDay_Control1000000611Caption; LostDay_Control1000000611CaptionLbl)
            {
            }
            column(FishgDay_Control1000000613Caption; FishgDay_Control1000000613CaptionLbl)
            {
            }
            column(ETAConsCaption; ETAConsCaptionLbl)
            {
            }
            column(VessEndrCaption; VessEndrCaptionLbl)
            {
            }
            column(SkipperCaption; SkipperCaptionLbl)
            {
            }
            column(BudgetCaption_Control1000000446; BudgetCaption_Control1000000446Lbl)
            {
            }
            column(ActualCaption_Control1000000445; ActualCaption_Control1000000445Lbl)
            {
            }
            column(VarianceCaption_Control1000000286; VarianceCaption_Control1000000286Lbl)
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
                /*MARK(TRUE);
                //VoyageFilter:=COPYSTR(VoyageFilter+"No."+'|',1,1024);
                //VoyageFilter:=VoyageFilter+"No."+'|';
                IF (NOT MARK(TRUE)) THEN ERROR('Not Marked');;
                
                IF Res.GET("Person Responsible") THEN;
                  ETD:= "Starting Date";
                  ETA:= "Ending Date";
                  IF (ETD<>0D) AND (ETD<ETDCons) THEN ETDCons:=ETD;
                  IF (ETA<>0D) AND (ETA>ETACons) THEN ETACons:=ETA;
                
                    //Cycle Day
                  Job2.GET("No.");
                  Job2.SETCURRENTKEY(Job2.Vessel,Job2."Starting Date");
                  Job2.SETRANGE(Job2.Vessel,Vessel);    //Find last voyage
                  IF Job2.NEXT(-1)<>0 THEN
                    ETA2:=Job2."Ending Date"
                  ELSE
                  BEGIN
                    IF Loc.GET(Vessel) THEN ETA2:=Loc."Begining ETA" ELSE ETA2:=010103D;
                  END;
                
                  IF "Cycle Day (Manual)"<>0 THEN CycleDay:="Cycle Day (Manual)"
                    ELSE CycleDay:=ETA-ETA2;
                
                  CALCFIELDS("Lost Days");
                  IF "Lost At Sea (Manual)"<>0 THEN LostDay:= "Lost At Sea (Manual)"
                    ELSE LostDay:="Lost Days";
                
                  IF "Fishing Day (Manual)"<>0 THEN FishgDay:="Fishing Day (Manual)"
                     ELSE FishgDay:="Sea Days"-LostDay;
                
                  IF "Port Day (Manual)"<>0 THEN PortDay:="Port Day (Manual)"
                    ELSE PortDay:=CycleDay-(FishgDay+LostDay);
                  SeaDay:=FishgDay+LostDay;
                
                
                //Creating Sub Header for the columns
                Countx:=MaxCount;
                REPEAT
                  IF Vessel=SeaRange[Countx] THEN
                  BEGIN
                    CellDefHd;
                    ColumnNo:=Countx*3;
                    SubHdr2A[Countx]:=Loc."Vessel Endurance"; EnterCell(8,ColumnNo,FORMAT(SubHdr2A[Countx]),FALSE,FALSE,FALSE);
                    SubHdr3A[Countx]:=ETA;                    EnterCell(9,ColumnNo,FORMAT(SubHdr3A[Countx]),FALSE,FALSE,FALSE);
                    SubHdr4A[Countx]:=FishgDay;               EnterCell(10,ColumnNo,FORMAT(SubHdr4A[Countx]),FALSE,FALSE,FALSE);
                    SubHdr5A[Countx]:=LostDay;                EnterCell(11,ColumnNo,FORMAT(SubHdr5A[Countx]),FALSE,FALSE,FALSE);
                    SubHdr6A[Countx]:=PortDay;                EnterCell(12,ColumnNo,FORMAT(SubHdr6A[Countx]),FALSE,FALSE,FALSE);
                    VessEndr:=VessEndr+SubHdr2A[Countx];
                  END;
                Countx:=Countx-1;
                UNTIL Countx=0;
                
                //AAA
                HDTd[1]:=ETDCons;
                HDT[2]:=HDT[2]+VessEndr;
                HDT[4]:=HDT[4]+FishgDay;
                HDT[5]:=HDT[5]+LostDay;
                HDT[6]:=HDT[6]+PortDay;
                
                
                  //Find Total Tonnage of Export
                  SETFILTER("Task Filter",'SHR');
                  CALCFIELDS("Product Quantity","Points Actual");
                  ExpTonnage:="Product Quantity"/1000;
                  PntStor[1]:="Points Actual";
                
                  SETFILTER("Task Filter",'');
                  CALCFIELDS("Points Actual");
                  PntStor[3]:="Points Actual";
                  PntStor[2]:=PntStor[3]-PntStor[1];
                
                  IF SeaDay<>0 THEN
                  BEGIN
                    PntStor[4]:=PntStor[1]/SeaDay;
                    PntStor[5]:=PntStor[2]/SeaDay;
                    PntStor[6]:=PntStor[3]/SeaDay;
                  END;
                  VALIDATE("Net Incentive Actual");
                  DataStor[3]:="Net Incentive Actual";
                
                
                  JobSetUp.GET; a:=100;
                
                  //Calculate the Fixed Salaries
                  JBudLn.SETRANGE(JBudLn."Job No.","No.");
                  //JBudLn.SETRANGE(JBudLn.Type,JBudLn.Type::Resource);
                  IF JBudLn.FIND('-') THEN
                  BEGIN
                     JBudLn.CALCFIELDS(JBudLn.Counter);
                     PeopleOnVoy:=JBudLn.Counter;
                  END
                  ELSE PeopleOnVoy:="No. of Deck Hands"+2;
                  DataStor[4]:=JobSetUp."Fixed Salary Rate"*CycleDay*(PeopleOnVoy);
                
                  //Travelling Expenses for Expatriate
                  expcnt:=0;
                  REPEAT
                    Employee.SETCURRENTKEY(Employee."Resource No.");
                    Employee.SETRANGE(Employee."Resource No.",JBudLn."No.");
                    Employee.SETFILTER(Employee."Country/Region Code",'<>NG');
                    IF Employee.FIND('-') THEN expcnt:=expcnt+1;
                    ResCount:=ResCount+1;
                  UNTIL JBudLn.NEXT()=0;
                  expcntTot:=expcnt;
                  DataStor[5]:=JobSetUp."Travelling Expenses Rate"*expcnt*CycleDay;
                
                  //License Fee
                  IF Coutry.GET("Fishing Country Code") THEN
                     DataStor[6]:=Coutry."License Fees Rate"*CycleDay
                  ELSE
                    BEGIN
                      DataStor[6]:=JobSetUp."License Fee Rate"*CycleDay;
                      Coutry.Name:='Nigeria';
                    END;
                  IF Loc.GET(Vessel) THEN
                  BEGIN
                    DataStor[7] :=Loc."Insurance Rate"*CycleDay;
                    DataStor[13]:=Loc."Depreciation Rate"*CycleDay;
                    DataStor[14]:=Loc."Interest Rate"*CycleDay;
                    Vess:=Loc.Name;
                  END;
                
                  DataStor[8]:=JobSetUp.Clearing_Fwrd_NPA*ExpTonnage;
                  DataStor[12]:=JobSetUp."Shore Overheads"*CycleDay;
                
                  //Credit from G/L Entry
                  CountGPPG:=0;
                  IF ProdPostGrp.FIND('-') THEN
                  REPEAT
                    CountGPPG:=CountGPPG+1;
                    "GLGPP Caption"[CountGPPG]:=ProdPostGrp.Code;
                    GLEntry.SETCURRENTKEY(GLEntry."G/L Account No.",GLEntry."Job No.",GLEntry."Gen. Prod. Posting Group");
                    GLEntry.SETRANGE(GLEntry."G/L Account No.",JobSetUp."Job Val Begin Account",JobSetUp."Job Val End Account");
                    GLEntry.SETRANGE(GLEntry."Job No.","No.");
                    GLEntry.SETRANGE(GLEntry."Gen. Prod. Posting Group",ProdPostGrp.Code);
                    IF GLEntry.FIND('-') THEN
                    REPEAT
                        GLStr[CountGPPG]:=GLStr[CountGPPG] +GLEntry.Amount;
                    UNTIL GLEntry.NEXT()=0;
                  UNTIL ProdPostGrp.NEXT()=0;
                
                CurrExc.SETRANGE(CurrExc."Currency Code",'USD');
                CurrExc.SETRANGE(CurrExc."Starting Date",0D,ETA);
                IF CurrExc.FIND('+') THEN
                  BEGIN
                    CurrRate:=CurrExc."Relational Exch. Rate Amount";
                    //MESSAGE('EXCHANGE VALUE IS %1',CurrExc."Relational Exch. Rate Amount")
                  END
                  ELSE CurrRate:=1;
                  PntStor[7]:=CurrRate;  *///  & u

            end;

            trigger OnPostDataItem()
            begin
                if StrLen(VoyageFilter) > 1 then VoyageFilter := CopyStr(VoyageFilter, 1, StrLen(VoyageFilter) - 1);

                if ETDCons = "Period End" then ETDCons := "Period Start";
                if ETACons = "Period Start" then ETACons := "Period End";

                HDTd[1] := ETDCons;
                HDT[2] := VessEndr;
                HDT[4] := FishgDay;
                HDT[5] := LostDay;
                HDT[6] := PortDay;
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
                    locate.CalcFields(locate."Qty to Cold Room", locate."Qty Budgeted");
                    if (locate."Qty to Cold Room" <> 0) then begin
                        //MESSAGE('I am Location %1',locate.Code);
                        SeaRange[Countx] := locate.Code;
                        EnterCell(4, Countx * 3, SeaRange[Countx], false, false, false);
                        Countx := Countx + 1;
                    end;
                until locate.Next = 0;

                MaxCount := Countx;
                repeat
                    CurrReport.CreateTotals(SubHdr2A[Countx]);
                    CurrReport.CreateTotals(SubHdr4A[Countx]);
                    CurrReport.CreateTotals(SubHdr5A[Countx]);
                    CurrReport.CreateTotals(SubHdr6A[Countx]);
                    Countx := Countx - 1;
                until Countx = 0;
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
                column(JbLedMark__Entry_No__; "Entry No.")
                {
                }
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
                column(JbLedMark__Entry_No__Caption; FieldCaption("Entry No."))
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

                /*JbLe.SETRANGE(JbLe."Marked Rec",TRUE);
                IF JbLe.FIND('-') THEN
                REPEAT
                   JbLe1.GET(JbLe."Entry No.");
                   JbLe1."Marked Rec":=FALSE;JbLe1.MODIFY;
                UNTIL JbLe.NEXT=0;
                
                JbBe.SETRANGE(JbBe."Marked Rec",TRUE);
                IF JbBe.FIND('-') THEN
                REPEAT
                   IF JbBe1.GET(JbBe."Table Name",JbBe."No.",JbBe.Code,JbBe."Pack Size") THEN;
                   JbBe1."Marked Rec":=FALSE;JbBe1.MODIFY;
                UNTIL JbBe.NEXT=0;
                
                Vale.SETRANGE(Vale."Marked Rec",TRUE);
                IF Vale.FIND('-') THEN
                REPEAT
                   Vale1.GET(Vale."Entry No.");
                   Vale1."Marked Rec":=FALSE;Vale1.MODIFY;
                UNTIL Vale.NEXT=0;
                */

            end;
        }
        dataitem("Sea Food categories"; "Sea Food categories")
        {
            DataItemTableView = SORTING ("Sea food code");
            column(Sea_Food_categories__Sea_food_code_; "Sea food code")
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
            column(A1_1__Control1000000323; A1[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(A2_1__Control1000000316; A2[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(COPYSTR___Sea_food_code__5__Control1000000324; CopyStr("Sea food code", 5))
            {
            }
            column(SeaRangeC_20_; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19_; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18_; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_17_; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_16_; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_15_; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_14_; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_13_; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_12_; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11_; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_10_; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_9_; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_8_; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7_; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6_; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_20_; SeaRangeCBud[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_19_; SeaRangeCBud[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_18_; SeaRangeCBud[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_17_; SeaRangeCBud[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_16_; SeaRangeCBud[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_15_; SeaRangeCBud[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_14_; SeaRangeCBud[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_13_; SeaRangeCBud[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_12_; SeaRangeCBud[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_11_; SeaRangeCBud[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_10_; SeaRangeCBud[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_9_; SeaRangeCBud[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_8_; SeaRangeCBud[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_7_; SeaRangeCBud[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_6_; SeaRangeCBud[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5_; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_4_; SeaRangeCBud[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_3_; SeaRangeCBud[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_2_; SeaRangeCBud[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_20_; SeaRangeCVar[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_19_; SeaRangeCVar[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_18_; SeaRangeCVar[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_17_; SeaRangeCVar[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_16_; SeaRangeCVar[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_15_; SeaRangeCVar[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_14_; SeaRangeCVar[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_13_; SeaRangeCVar[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_12_; SeaRangeCVar[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_11_; SeaRangeCVar[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_10_; SeaRangeCVar[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_9_; SeaRangeCVar[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_8_; SeaRangeCVar[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_7_; SeaRangeCVar[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_6_; SeaRangeCVar[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_5_; SeaRangeCVar[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_4_; SeaRangeCVar[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_3_; SeaRangeCVar[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_2_; SeaRangeCVar[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(A1_1__A2_1_; A1[1] - A2[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_2_; SeaRangeC[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_3_; SeaRangeC[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_4_; SeaRangeC[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_5_; SeaRangeCBud[5])
            {
                DecimalPlaces = 0 : 0;
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
            column(A1_1__A2_1__Control1000000687; A1[1] - A2[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(A1_1__Control1000000688; A1[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(A2_1__Control1000000689; A2[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_5__Control1000000335; SeaRangeCBud[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5__Control1000000336; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_5__Control1000000337; SeaRangeCVar[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_6__Control1000000338; SeaRangeCBud[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6__Control1000000339; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_6__Control1000000340; SeaRangeCVar[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_7__Control1000000341; SeaRangeCBud[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7__Control1000000368; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_7__Control1000000369; SeaRangeCVar[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_8__Control1000000370; SeaRangeCBud[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_8__Control1000000371; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_8__Control1000000372; SeaRangeCVar[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_9__Control1000000404; SeaRangeCBud[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_9__Control1000000405; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_9__Control1000000406; SeaRangeCVar[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_10__Control1000000407; SeaRangeCBud[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_10__Control1000000408; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_10__Control1000000409; SeaRangeCVar[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_11__Control1000000410; SeaRangeCBud[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11__Control1000000411; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_11__Control1000000412; SeaRangeCVar[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_12__Control1000000413; SeaRangeCBud[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_12__Control1000000414; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_12__Control1000000415; SeaRangeCVar[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_13__Control1000000416; SeaRangeCBud[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_13__Control1000000417; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_13__Control1000000418; SeaRangeCVar[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_14__Control1000000419; SeaRangeCBud[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_14__Control1000000420; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_14__Control1000000421; SeaRangeCVar[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_15__Control1000000422; SeaRangeCBud[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_15__Control1000000423; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_15__Control1000000424; SeaRangeCVar[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_16__Control1000000425; SeaRangeCBud[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_16__Control1000000426; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_16__Control1000000427; SeaRangeCVar[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_17__Control1000000428; SeaRangeCBud[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_17__Control1000000429; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_17__Control1000000430; SeaRangeCVar[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_18__Control1000000431; SeaRangeCBud[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000432; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_18__Control1000000433; SeaRangeCVar[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_19__Control1000000434; SeaRangeCBud[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000435; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_19__Control1000000436; SeaRangeCVar[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_20__Control1000000437; SeaRangeCBud[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000438; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_20__Control1000000439; SeaRangeCVar[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_2__Control1000000000; SeaRangeCBud[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_2__Control1000000001; SeaRangeC[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_2__Control1000000002; SeaRangeCVar[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_3__Control1000000003; SeaRangeCBud[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_3__Control1000000194; SeaRangeC[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_3__Control1000000196; SeaRangeCVar[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_4__Control1000000202; SeaRangeCBud[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_4__Control1000000203; SeaRangeC[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_4__Control1000000206; SeaRangeCVar[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_1__Control1000000287; SeaRangeCBud[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_1__Control1000000288; SeaRangeC[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_1__Control1000000289; SeaRangeCVar[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaVal2X_NairaValBX; NairaVal2X - NairaValBX)
            {
            }
            column(NairaValBX; NairaValBX)
            {
            }
            column(PrdPrcBX; PrdPrcBX)
            {
            }
            column(QtyBX; QtyBX)
            {
            }
            column(NairaVal2X; NairaVal2X)
            {
            }
            column(PrdPrc2X; PrdPrc2X)
            {
            }
            column(QtyX; QtyX)
            {
            }
            column(TotalForX; TotalForX)
            {
            }
            column(TotalFor; TotalFor)
            {
            }
            column(Qty; Qty)
            {
            }
            column(PrdPrc2; PrdPrc2)
            {
            }
            column(NairaVal2; NairaVal2)
            {
            }
            column(QtyB; QtyB)
            {
            }
            column(PrdPrcB; PrdPrcB)
            {
            }
            column(NairaValB; NairaValB)
            {
            }
            column(NairaVal2_NairaValB; NairaVal2 - NairaValB)
            {
            }
            column(NairaVal2_NairaValB___NairaVal2X_NairaValBX_; (NairaVal2 - NairaValB) - (NairaVal2X - NairaValBX))
            {
            }
            column(NairaValB_NairaValBX; NairaValB - NairaValBX)
            {
            }
            column(PrdPrcB_PrdPrcBX; PrdPrcB - PrdPrcBX)
            {
            }
            column(QtyB_QtyBX; QtyB - QtyBX)
            {
            }
            column(NairaVal2_NairaVal2X; NairaVal2 - NairaVal2X)
            {
            }
            column(PrdPrc2_PrdPrc2X; PrdPrc2 - PrdPrc2X)
            {
            }
            column(Qty_QtyX; Qty - QtyX)
            {
            }
            column(TotalFory; TotalFory)
            {
            }
            column(Sea_Food_categories__Sea_food_code_Caption; FieldCaption("Sea food code"))
            {
            }
            dataitem("Job Ledger Entry"; "Job Ledger Entry")
            {
                DataItemLink = GroupSort = FIELD ("Sea food code");
                DataItemTableView = SORTING (GroupSort, "Location Code", "Gen. Prod. Posting Group", "Marked Rec") WHERE ("Location Code" = CONST ('CRM-ASL'), "Gen. Prod. Posting Group" = FILTER ('FIS' | ''), "Marked Rec" = CONST (true));
                column(Job_Ledger_Entry_GroupSort; GroupSort)
                {
                }
                column(Job_Ledger_Entry__No__; "No.")
                {
                }
                column(NairaVal2_Control1000000066; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000067; PrdPrc2)
                {
                }
                column(Qty_Control1000000068; Qty)
                {
                }
                column(Job_Ledger_Entry_GroupSort_Control1000000069; GroupSort)
                {
                }
                column(NairaVal2_Control1000000071; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000072; PrdPrc2)
                {
                }
                column(Qty_Control1000000073; Qty)
                {
                }
                column(COPYSTR_GroupSort_5_; CopyStr(GroupSort, 5))
                {
                }
                column(NairaVal2_Control1000000075; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000076; PrdPrc2)
                {
                }
                column(Qty_Control1000000077; Qty)
                {
                }
                column(TotalFor_Control1000000078; TotalFor)
                {
                }
                column(Job_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Job_Ledger_Entry_Job_No_; "Job No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Qty := Quantity * -1;
                    Itempr.SetRange(Itempr."Item No.", "No.");
                    Itempr.SetRange(Itempr."Starting Date", 0D, "Posting Date");
                    if Itempr.Find('+') then
                        Prc := Itempr."Unit Price" else begin
                        Prc := 0;
                        if Flag then Message('Price Missing for Item %1 %2', "No.", "Job No.", Itempr."Item No.");
                    end;
                    PrdPrc := Qty * Prc;

                    //Quatity By Location(Vessel);
                    level := TotLoc + 1;
                    repeat
                        if SeaRange[level] = "Job Ledger Entry"."Source Code" then
                            SeaRangeC[level] := SeaRangeC[level] + Qty;
                        level := level - 1;
                    until level = 0
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo(GroupSort);
                    CurrReport.CreateTotals(PrdPrc2, NairaVal2, Qty);
                end;
            }
            dataitem("Job catch Default"; "Job catch Default")
            {
                DataItemLink = GroupSort = FIELD ("Sea food code");
                DataItemTableView = SORTING (GroupSort, "Marked Rec") WHERE ("Marked Rec" = CONST (true));
                column(No_B_; "No.B")
                {
                }
                column(NairaValB_Control1000000115; NairaValB)
                {
                }
                column(PrdPrcB_Control1000000116; PrdPrcB)
                {
                }
                column(QtyB_Control1000000117; QtyB)
                {
                }
                column(Job_catch_Default_GroupSort; GroupSort)
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

                    if JobETA.Get("No.") then
                        Itempr.SetRange(Itempr."Starting Date", 0D, JobETA."Ending Date")
                    else
                        Itempr.SetRange(Itempr."Starting Date", 0D, "Period End");

                    if Itempr.Find('+') then PrcB := Itempr."Unit Price" else PrcB := 0;
                    PrdPrcB := QtyB * PrcB;

                    //Quatity By Location(Vessel);
                    level := TotLoc + 1;
                    repeat
                        if SeaRange[level] = "Job catch Default".Vessel then
                            SeaRangeCBud[level] := SeaRangeCBud[level] + QtyB;
                        level := level - 1;
                    until level = 0
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo(GroupSort);
                    CurrReport.CreateTotals(PrdPrcB, NairaValB, QtyB);

                    //Budget By Location(Vessel) - Init;
                    level := TotLoc + 1;
                    repeat
                        SeaRangeCBud[level] := 0;
                        level := level - 1;
                    until level = 0
                end;
            }

            trigger OnAfterGetRecord()
            begin
                A1[1] := 0;
                A1[2] := 0;
                A1[3] := 0;
                A1[4] := 0;
                A2[1] := 0;
                A2[2] := 0;
                A2[3] := 0;
                A2[4] := 0;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(PrdPrc2, NairaVal2, Qty);
                CurrReport.CreateTotals(PrdPrcB, NairaValB, QtyB);
                CurrReport.CreateTotals(A2[1], A1[1], A2[2], A1[2]);
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
        dataitem("Sea Food categories1"; "Sea Food categories")
        {
            DataItemTableView = SORTING ("Sea food code");
            column(Sea_Food_categories1__Sea_food_code_; "Sea food code")
            {
            }
            column(A2_4__Control1000000060; A2[4])
            {
            }
            column(A2_3__Control1000000061; A2[3])
            {
            }
            column(A2_2__Control1000000062; A2[2])
            {
            }
            column(A2_1__Control1000000063; A2[1])
            {
            }
            column(A1_4__1000_Control1000000064; A1[4] * 1000)
            {
            }
            column(A1_3__Control1000000079; A1[3])
            {
            }
            column(A1_2__Control1000000086; A1[2])
            {
            }
            column(A1_1__Control1000000087; A1[1])
            {
            }
            column(COPYSTR___Sea_food_code__5__Control1000000088; CopyStr("Sea food code", 5))
            {
            }
            column(A2_2__Control1000000021; A2[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(A1_2__Control1000000309; A1[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(COPYSTR___Sea_food_code__5__Control1000000312; CopyStr("Sea food code", 5))
            {
            }
            column(A1_2__A2_2_; A1[2] - A2[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_2__Control1000000562; SeaRangeCBud[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_2__Control1000000563; SeaRangeC[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_2__Control1000000564; SeaRangeCVar[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_3__Control1000000627; SeaRangeCBud[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_3__Control1000000628; SeaRangeC[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_3__Control1000000629; SeaRangeCVar[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_4__Control1000000630; SeaRangeCBud[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_4__Control1000000631; SeaRangeC[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_4__Control1000000632; SeaRangeCVar[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_5__Control1000000633; SeaRangeCBud[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5__Control1000000634; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_5__Control1000000635; SeaRangeCVar[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_6__Control1000000636; SeaRangeCBud[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6__Control1000000637; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_6__Control1000000638; SeaRangeCVar[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_7__Control1000000639; SeaRangeCBud[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7__Control1000000640; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_7__Control1000000641; SeaRangeCVar[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_8__Control1000000642; SeaRangeCBud[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_8__Control1000000643; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_8__Control1000000644; SeaRangeCVar[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_9__Control1000000645; SeaRangeCBud[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_9__Control1000000646; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_9__Control1000000647; SeaRangeCVar[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_10__Control1000000648; SeaRangeCBud[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_10__Control1000000649; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_10__Control1000000650; SeaRangeCVar[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_11__Control1000000651; SeaRangeCBud[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11__Control1000000652; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_11__Control1000000653; SeaRangeCVar[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_12__Control1000000654; SeaRangeCBud[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_12__Control1000000655; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_12__Control1000000656; SeaRangeCVar[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_13__Control1000000657; SeaRangeCBud[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_13__Control1000000658; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_13__Control1000000659; SeaRangeCVar[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_14__Control1000000660; SeaRangeCBud[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_14__Control1000000661; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_14__Control1000000662; SeaRangeCVar[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_15__Control1000000663; SeaRangeCBud[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_15__Control1000000664; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_15__Control1000000665; SeaRangeCVar[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_16__Control1000000666; SeaRangeCBud[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_16__Control1000000667; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_16__Control1000000668; SeaRangeCVar[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_17__Control1000000669; SeaRangeCBud[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_17__Control1000000670; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_17__Control1000000671; SeaRangeCVar[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_18__Control1000000672; SeaRangeCBud[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000673; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_18__Control1000000674; SeaRangeCVar[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_19__Control1000000675; SeaRangeCBud[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000676; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_19__Control1000000677; SeaRangeCVar[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_20__Control1000000678; SeaRangeCBud[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000679; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_20__Control1000000680; SeaRangeCVar[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_1__Control1000000559; SeaRangeCBud[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_1__Control1000000560; SeaRangeC[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_1__Control1000000561; SeaRangeCVar[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotalForX_Control1000000056; TotalForX)
            {
            }
            column(TotalFory_Control1000000058; TotalFory)
            {
            }
            column(SeaRangeCBud_5__Control1000000511; SeaRangeCBud[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5__Control1000000512; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_5__Control1000000513; SeaRangeCVar[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_6__Control1000000514; SeaRangeCBud[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6__Control1000000515; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_6__Control1000000516; SeaRangeCVar[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_7__Control1000000517; SeaRangeCBud[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7__Control1000000518; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_7__Control1000000519; SeaRangeCVar[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_8__Control1000000520; SeaRangeCBud[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_8__Control1000000521; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_8__Control1000000522; SeaRangeCVar[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_9__Control1000000523; SeaRangeCBud[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_9__Control1000000524; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_9__Control1000000525; SeaRangeCVar[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_10__Control1000000526; SeaRangeCBud[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_10__Control1000000527; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_10__Control1000000528; SeaRangeCVar[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_11__Control1000000529; SeaRangeCBud[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11__Control1000000530; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_11__Control1000000531; SeaRangeCVar[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_12__Control1000000532; SeaRangeCBud[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_12__Control1000000533; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_12__Control1000000534; SeaRangeCVar[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_13__Control1000000535; SeaRangeCBud[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_13__Control1000000536; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_13__Control1000000537; SeaRangeCVar[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_14__Control1000000538; SeaRangeCBud[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_14__Control1000000539; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_14__Control1000000540; SeaRangeCVar[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_15__Control1000000541; SeaRangeCBud[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_15__Control1000000542; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_15__Control1000000543; SeaRangeCVar[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_16__Control1000000544; SeaRangeCBud[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_16__Control1000000545; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_16__Control1000000546; SeaRangeCVar[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_17__Control1000000547; SeaRangeCBud[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_17__Control1000000548; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_17__Control1000000549; SeaRangeCVar[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_18__Control1000000550; SeaRangeCBud[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000551; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_18__Control1000000552; SeaRangeCVar[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_19__Control1000000553; SeaRangeCBud[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000554; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_19__Control1000000555; SeaRangeCVar[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_20__Control1000000556; SeaRangeCBud[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000557; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_20__Control1000000558; SeaRangeCVar[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar3_4_; SeaRangeCVar3[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC3_4_; SeaRangeC3[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud3_4_; SeaRangeCBud3[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar3_3_; SeaRangeCVar3[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC3_3_; SeaRangeC3[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud3_3_; SeaRangeCBud3[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar3_2_; SeaRangeCVar3[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC3_2_; SeaRangeC3[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud3_2_; SeaRangeCBud3[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(PrdPrc2X_PrdPrcBX; PrdPrc2X - PrdPrcBX)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaVal2_NairaValB___NairaVal2X_NairaValBX__Control1000000025; (NairaVal2 - NairaValB) - (NairaVal2X - NairaValBX))
            {
                DecimalPlaces = 0 : 0;
            }
            column(PrdPrc2X_Control1000000041; PrdPrc2X)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaVal2_NairaVal2X_Control1000000043; NairaVal2 - NairaVal2X)
            {
                DecimalPlaces = 0 : 0;
            }
            column(PrdPrcBX_Control1000000050; PrdPrcBX)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaValB_NairaValBX_Control1000000052; NairaValB - NairaValBX)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaValB_Control1000000057; NairaValB)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaVal2_NairaValB_Control1000000442; NairaVal2 - NairaValB)
            {
                DecimalPlaces = 0 : 0;
            }
            column(NairaVal2_Control1000000443; NairaVal2)
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotalFor_____GLSetup__LCY_Code_____; TotalFor + '(' + GLSetup."LCY Code" + ')')
            {
            }
            column(SeaRangeCBud1_2_; SeaRangeCBud1[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC1_2_; SeaRangeC1[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar1_2_; SeaRangeCVar1[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud1_3_; SeaRangeCBud1[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC1_3_; SeaRangeC1[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar1_3_; SeaRangeCVar1[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud1_4_; SeaRangeCBud1[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC1_4_; SeaRangeC1[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar1_4_; SeaRangeCVar1[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_5__Control1000000566; SeaRangeCBud[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5__Control1000000567; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_5__Control1000000568; SeaRangeCVar[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_6__Control1000000569; SeaRangeCBud[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6__Control1000000570; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_6__Control1000000571; SeaRangeCVar[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_7__Control1000000572; SeaRangeCBud[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7__Control1000000573; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_7__Control1000000574; SeaRangeCVar[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud2_2_; SeaRangeCBud2[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC2_2_; SeaRangeC2[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar2_2_; SeaRangeCVar2[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud2_3_; SeaRangeCBud2[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC2_3_; SeaRangeC2[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar2_3_; SeaRangeCVar2[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud2_4_; SeaRangeCBud2[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC2_4_; SeaRangeC2[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar2_4_; SeaRangeCVar2[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_5__Control1000000593; SeaRangeCBud[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5__Control1000000594; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_5__Control1000000595; SeaRangeCVar[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_6__Control1000000596; SeaRangeCBud[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6__Control1000000597; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_6__Control1000000598; SeaRangeCVar[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_7__Control1000000599; SeaRangeCBud[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7__Control1000000600; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_7__Control1000000601; SeaRangeCVar[7])
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
                column(NairaVal2_Control1000000152; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000195; PrdPrc2)
                {
                }
                column(Qty_Control1000000197; Qty)
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
                column(COPYSTR_GroupSort_5__Control1000000255; CopyStr(GroupSort, 5))
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
                column(Job_Ledger_Entry1_Entry_No_; "Entry No.")
                {
                }
                column(Job_Ledger_Entry1_Job_No_; "Job No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //Rate for line
                    CurrExc.SetRange(CurrExc."Currency Code", 'USD');
                    CurrExc.SetRange(CurrExc."Starting Date", 0D, "Posting Date");
                    if CurrExc.Find('+') then
                        CurrRate := CurrExc."Relational Exch. Rate Amount" //MESSAGE('EXCHANGE VALUE IS %1',CurrExc."Relational Exch. Rate Amount")
                    else
                        CurrRate := 1;

                    //Item Price
                    Itempr.SetRange(Itempr."Item No.", "No.");
                    Itempr.SetRange(Itempr."Starting Date", 0D, "Posting Date");
                    if Itempr.Find('+') then
                        Prc := Itempr."Unit Price" else begin
                        Prc := 0;
                        if Flag then Message('Price Missing for Item %1 %2', "No.", "Job No.", Itempr."Item No.");
                    end;

                    Qty := Quantity * -1;
                    PrdPrc := Qty * Prc;
                    PrdPrc2 := PrdPrc;

                    if Itempr."Currency Code" <> '' then
                        NairaVal2 := PrdPrc2 * CurrRate
                    else begin
                        NairaVal2 := Qty * Prc;
                        PrdPrc2 := 0;
                    end;

                    //Grouping Export From Local
                    if Evaluate(NOrder, CopyStr(GroupSort, 2, 2)) then;  //MESSAGE('Value is OF %1 = %2',GroupSort,NOrder);
                    if NOrder < 8 then begin
                        QtyX := QtyX + Qty;
                        PrdPrc2X := PrdPrc2X + PrdPrc2;
                        NairaVal2X := NairaVal2X + NairaVal2;
                    end;

                    //Value By Location(Vessel);
                    level := TotLoc + 1;
                    repeat
                        if SeaRange[level] = "Job Ledger Entry1"."Source Code" then begin
                            SeaRangeC[level] := SeaRangeC[level] + PrdPrc;
                            if PrdPrc2 <> 0 then
                                SeaRangeC1[level] := SeaRangeC1[level] + PrdPrc;     // SeaRangeC1::: Export Line
                            if PrdPrc2 = 0 then
                                SeaRangeC2[level] := SeaRangeC2[level] + NairaVal2;  // SeaRangeC2::: Local Line
                            SeaRangeC3[level] := SeaRangeC3[level] + NairaVal2;  // SeaRangeC3::: Naira Line
                        end;
                        level := level - 1;
                    until level = 0;
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
                column(No_B__Control1000000089; "No.B")
                {
                }
                column(NairaValB_Control1000000090; NairaValB)
                {
                }
                column(PrdPrcB_Control1000000091; PrdPrcB)
                {
                }
                column(QtyB_Control1000000092; QtyB)
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
                    QtyB := "Budget Quantity";
                    Syntesis(Code, "Pack Size", Brand); //Compose No.

                    //Rate for line
                    CurrExc.SetRange(CurrExc."Currency Code", 'USD');
                    if JobETA.Get("No.") then
                        CurrExc.SetRange(CurrExc."Starting Date", 0D, JobETA."Ending Date")
                    else
                        CurrExc.SetRange(CurrExc."Starting Date", 0D, "Period End");

                    if CurrExc.Find('+') then begin
                        CurrRate := CurrExc."Relational Exch. Rate Amount"; //MESSAGE('EXCHANGE VALUE IS %1',CurrExc."Relational Exch. Rate Amount")
                    end
                    else
                        CurrRate := 1;

                    //Item Pricing
                    Itempr.SetRange(Itempr."Item No.", "No.B");

                    if JobETA.Get("No.") then
                        Itempr.SetRange(Itempr."Starting Date", 0D, JobETA."Ending Date")
                    else
                        Itempr.SetRange(Itempr."Starting Date", 0D, "Period End");

                    if Itempr.Find('+') then PrcB := Itempr."Unit Price" else PrcB := 0;

                    PrdPrcBu := QtyB * PrcB;
                    PrdPrcB := PrdPrcBu;

                    if Itempr."Currency Code" <> '' then
                        NairaValB := PrdPrcB * CurrRate
                    else begin
                        NairaValB := QtyB * PrcB;
                        PrdPrcB := 0;
                    end;

                    if Evaluate(NOrder, CopyStr(GroupSort, 2, 2)) then;  //MESSAGE('Value is OF %1 = %2',GroupSort,NOrder);
                    if NOrder < 8 then begin
                        QtyBX := QtyBX + QtyB;
                        PrdPrcBX := PrdPrcBX + PrdPrcB;
                        NairaValBX := NairaValBX + NairaValB;
                    end;

                    //Value By Location(Vessel);
                    level := TotLoc + 1;
                    repeat
                        if SeaRange[level] = "Job Catch Default1".Vessel then begin
                            SeaRangeCBud[level] := SeaRangeCBud[level] + PrdPrcBu;
                            if PrdPrcB <> 0 then
                                SeaRangeCBud1[level] := SeaRangeCBud1[level] + PrdPrcB;
                            if PrdPrcB = 0 then
                                SeaRangeCBud2[level] := SeaRangeCBud2[level] + NairaValB;
                            SeaRangeCBud3[level] := SeaRangeCBud3[level] + NairaValB;
                        end;
                        level := level - 1;
                    until level = 0;
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
                NairaVal2 := 0;
                NairaValB := 0;
                NairaVal2X := 0;
                NairaValBX := 0;

                //Quatity By Location(Vessel);
                level := TotLoc + 1;
                repeat
                    CurrReport.CreateTotals(SeaRangeC[level], SeaRangeCBud[level], SeaRangeCVar[level]);
                    SeaRangeC[level] := 0;
                    SeaRangeCBud[level] := 0;
                    SeaRangeCBud1[level] := 0;
                    SeaRangeCBud2[level] := 0;
                    SeaRangeCBud3[level] := 0;
                    level := level - 1;
                until level = 0;
            end;
        }
        dataitem("Sea Food categories2"; "Sea Food categories")
        {
            DataItemTableView = SORTING ("Sea food code");
            column(Sea_Food_categories2__Sea_food_code_; "Sea food code")
            {
            }
            column(Sea_Food_categories2__Landed_Value_; "Landed Value")
            {
            }
            column(Sea_Food_categories2__Entry_code_; "Entry code")
            {
            }
            column(Sea_Food_categories2__Sea_food_Description_; "Sea food Description")
            {
            }
            column(Sea_Food_categories2__Sea_food_code__Control1000000262; "Sea food code")
            {
            }
            column(A2_4__Control1000000294; A2[4])
            {
            }
            column(A2_3__Control1000000295; A2[3])
            {
            }
            column(A2_2__Control1000000296; A2[2])
            {
            }
            column(A2_1__Control1000000297; A2[1])
            {
            }
            column(A1_4__1000_Control1000000298; A1[4] * 1000)
            {
            }
            column(A1_3__Control1000000299; A1[3])
            {
            }
            column(A1_2__Control1000000300; A1[2])
            {
            }
            column(A1_1__Control1000000301; A1[1])
            {
            }
            column(Sea_Food_categories2__Sea_food_code__Control1000000247; "Sea food code")
            {
            }
            column(A2_4__Control1000000313; A2[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(A1_4_; A1[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(A1_4__A2_4_; -A1[4] - A2[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(COPYSTR___Sea_food_code__5__Control1000000037; CopyStr("Sea food code", 5))
            {
            }
            column(SeaRangeCBud_2__Control1000000684; SeaRangeCBud[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_2__Control1000000685; SeaRangeC[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_2__Control1000000691; SeaRangeCVar[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_3__Control1000000692; SeaRangeCBud[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_3__Control1000000694; SeaRangeC[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_3__Control1000000695; SeaRangeCVar[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_4__Control1000000697; SeaRangeCBud[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_4__Control1000000698; SeaRangeC[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_4__Control1000000700; SeaRangeCVar[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_5__Control1000000701; SeaRangeCBud[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5__Control1000000702; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_5__Control1000000704; SeaRangeCVar[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_6__Control1000000705; SeaRangeCBud[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6__Control1000000706; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_6__Control1000000707; SeaRangeCVar[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_7__Control1000000708; SeaRangeCBud[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7__Control1000000709; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_7__Control1000000710; SeaRangeCVar[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_8__Control1000000711; SeaRangeCBud[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_8__Control1000000712; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_8__Control1000000713; SeaRangeCVar[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_9__Control1000000714; SeaRangeCBud[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_9__Control1000000715; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_9__Control1000000716; SeaRangeCVar[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_10__Control1000000717; SeaRangeCBud[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_10__Control1000000718; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_10__Control1000000719; SeaRangeCVar[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_11__Control1000000720; SeaRangeCBud[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11__Control1000000721; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_11__Control1000000722; SeaRangeCVar[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_12__Control1000000723; SeaRangeCBud[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_12__Control1000000724; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_12__Control1000000725; SeaRangeCVar[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_13__Control1000000726; SeaRangeCBud[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_13__Control1000000727; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_13__Control1000000728; SeaRangeCVar[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_14__Control1000000729; SeaRangeCBud[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_14__Control1000000730; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_14__Control1000000731; SeaRangeCVar[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_15__Control1000000732; SeaRangeCBud[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_15__Control1000000733; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_15__Control1000000734; SeaRangeCVar[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_16__Control1000000735; SeaRangeCBud[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_16__Control1000000736; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_16__Control1000000737; SeaRangeCVar[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_17__Control1000000738; SeaRangeCBud[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_17__Control1000000739; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_17__Control1000000740; SeaRangeCVar[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_18__Control1000000741; SeaRangeCBud[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000742; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_18__Control1000000743; SeaRangeCVar[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_19__Control1000000744; SeaRangeCBud[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000745; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_19__Control1000000746; SeaRangeCVar[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_20__Control1000000747; SeaRangeCBud[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000748; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_20__Control1000000749; SeaRangeCVar[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCBud_1__Control1000000681; SeaRangeCBud[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_1__Control1000000682; SeaRangeC[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeCVar_1__Control1000000683; SeaRangeCVar[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sea_Food_categories2__Sea_food_code_Caption; FieldCaption("Sea food code"))
            {
            }
            dataitem("Job Ledger Entry2"; "Job Ledger Entry")
            {
                DataItemLink = GroupSort = FIELD ("Sea food code");
                DataItemTableView = SORTING (GroupSort, "Location Code", "Gen. Prod. Posting Group", "Marked Rec") WHERE ("Location Code" = CONST ('CRM-ASL'), "Gen. Prod. Posting Group" = FILTER ('FIS' | ''), "Marked Rec" = CONST (true));
                column(Job_Ledger_Entry2__No__; "No.")
                {
                }
                column(NairaVal2_Control1000000265; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000267; PrdPrc2)
                {
                }
                column(Qty_Control1000000269; Qty)
                {
                }
                column(Job_Ledger_Entry2_GroupSort; GroupSort)
                {
                }
                column(NairaVal2_Control1000000271; NairaVal2)
                {
                }
                column(PrdPrc2_Control1000000272; PrdPrc2)
                {
                }
                column(Qty_Control1000000273; Qty)
                {
                }
                column(COPYSTR_GroupSort_5__Control1000000274; CopyStr(GroupSort, 5))
                {
                }
                column(Job_Ledger_Entry2_Entry_No_; "Entry No.")
                {
                }
                column(Job_Ledger_Entry2_Job_No_; "Job No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Qty := Quantity * -1;
                    Itempr.SetRange(Itempr."Item No.", "No.");
                    Itempr.SetRange(Itempr."Starting Date", 0D, "Posting Date");
                    if Itempr.Find('+') then
                        Prc := Itempr."Unit Price" else begin
                        Prc := 0;
                        // IF Flag THEN MESSAGE('Price Missing for Item %1',Itempr."Item No.");
                        if Flag then Message('Price Missing for Item %1 %2', "No.", "Job No.", Itempr."Item No.");
                    end;
                    PrdPrc := Qty * Prc;

                    //Ratio By Location(Vessel);
                    level := TotLoc + 1;
                    repeat
                        if SeaRange[level] = "Job Ledger Entry2"."Source Code" then begin
                            StoreC[level] := Qty;
                            StoreCII[level] := PrdPrc;
                        end;
                        level := level - 1;
                    until level = 0
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo(GroupSort);
                    CurrReport.CreateTotals(PrdPrc2, NairaVal2, Qty);
                    level := TotLoc + 1;
                    repeat
                        CurrReport.CreateTotals(StoreC[level], StoreCII[level]);
                        level := level - 1;
                    until level = 0;

                    PrdPrcB := 0;
                    PrdPrcBX := 0;
                    PrdPrc2 := 0;
                    PrdPrc2X := 0;
                end;
            }
            dataitem("Job Catch Default2"; "Job catch Default")
            {
                DataItemLink = GroupSort = FIELD ("Sea food code");
                DataItemTableView = SORTING (GroupSort, "Marked Rec") WHERE ("Marked Rec" = CONST (true), "Budget Quantity" = FILTER (<> 0));
                column(No_B__Control1000000275; "No.B")
                {
                }
                column(NairaValB_Control1000000276; NairaValB)
                {
                }
                column(PrdPrcB_Control1000000277; PrdPrcB)
                {
                }
                column(QtyB_Control1000000278; QtyB)
                {
                }
                column(Job_Catch_Default2_GroupSort; GroupSort)
                {
                }
                column(No_B__Control1000000280; "No.B")
                {
                }
                column(NairaValB_Control1000000281; NairaValB)
                {
                }
                column(PrdPrcB_Control1000000282; PrdPrcB)
                {
                }
                column(QtyB_Control1000000283; QtyB)
                {
                }
                column(Job_Catch_Default2_GroupSort_Control1000000284; GroupSort)
                {
                }
                column(Job_Catch_Default2_Table_Name; "Table Name")
                {
                }
                column(Job_Catch_Default2_No_; "No.")
                {
                }
                column(Job_Catch_Default2_Code; Code)
                {
                }
                column(Job_Catch_Default2_Pack_Size; "Pack Size")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    QtyB := 0;
                    Syntesis(Code, "Pack Size", Brand); //Compose No.
                    QtyB := "Budget Quantity";
                    Itempr.SetRange(Itempr."Item No.", "No.B");

                    if JobETA.Get("No.") then
                        Itempr.SetRange(Itempr."Starting Date", 0D, JobETA."Ending Date")
                    else
                        Itempr.SetRange(Itempr."Starting Date", 0D, "Period End");

                    if Itempr.Find('+') then PrcB := Itempr."Unit Price" else PrcB := 0;
                    PrdPrcB := QtyB * PrcB;

                    //Value By Location(Vessel);
                    level := TotLoc + 1;
                    repeat
                        if SeaRange[level] = "Job Catch Default1".Vessel then begin
                            StoreCBud[level] := StoreCBud[level] + QtyB;
                            StoreCBudII[level] := StoreCBudII[level] + PrdPrcB;
                        end;
                        level := level - 1;
                    until level = 0
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo(GroupSort);
                    CurrReport.CreateTotals(PrdPrcB, NairaValB, QtyB);

                    level := TotLoc + 1;
                    repeat
                        CurrReport.CreateTotals(StoreCBud[level], StoreCBudII[level]);
                        level := level - 1;
                    until level = 0
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

                //Quatity By Location(Vessel);
                level := TotLoc + 1;
                repeat
                    CurrReport.CreateTotals(SeaRangeC[level], SeaRangeCBud[level], SeaRangeCVar[level]);
                    SeaRangeC[level] := 0;
                    SeaRangeCBud[level] := 0;
                    SeaRangeCVar[level] := 0;
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

    trigger OnInitReport()
    begin
        GLSetup.Get;
    end;

    trigger OnPostReport()
    begin
        REPORT.Run(50195);
    end;

    trigger OnPreReport()
    begin
        TempExcelBuffer.DeleteAll;
        Clear(TempExcelBuffer);
        cnt := 13;
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
        "Job led": Record "Job Ledger Entry";
        "job cath": Record "Job catch Default";
        "Val Ent": Record "Value Entry";
        GLSetup: Record "General Ledger Setup";
        Prc: Decimal;
        PrcB: Decimal;
        PrdPrc: Decimal;
        PrdPrcB: Decimal;
        PrdPrcBu: Decimal;
        PrdPrcBX: Decimal;
        PrdPrc2: Decimal;
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
        MaxCount: Integer;
        SeaRangeC: array[100] of Decimal;
        SeaRangeC1: array[100] of Decimal;
        SeaRangeC2: array[100] of Decimal;
        SeaRangeC3: array[100] of Decimal;
        SeaRangeCBud: array[100] of Decimal;
        SeaRangeCBud1: array[100] of Decimal;
        SeaRangeCBud2: array[100] of Decimal;
        SeaRangeCBud3: array[100] of Decimal;
        SeaRangeCVar: array[100] of Decimal;
        SeaRangeCVar1: array[100] of Decimal;
        SeaRangeCVar2: array[100] of Decimal;
        SeaRangeCVar3: array[100] of Decimal;
        T001: Text[80];
        SeaRange: array[100] of Text[30];
        Cat: Code[15];
        StoreC: array[100] of Decimal;
        StoreCBud: array[100] of Decimal;
        StoreCII: array[100] of Decimal;
        StoreCBudII: array[100] of Decimal;
        "------": Integer;
        TempExcelBuffer: Record "Excel Buffer 4 P&L";
        cnt: Integer;
        RowNo: Integer;
        ColumnNo: Integer;
        ColumnValue: Decimal;
        ColumnText: Text[50];
        T: array[3] of Decimal;
        VT: array[3, 3] of Decimal;
        HDT: array[6] of Decimal;
        HDTd: array[1] of Date;
        RwLabel: Text[50];
        "-------------": Integer;
        SubHdr1A: array[120] of Text[30];
        SubHdr2A: array[120] of Decimal;
        SubHdr3A: array[120] of Date;
        SubHdr4A: array[120] of Decimal;
        SubHdr5A: array[120] of Decimal;
        SubHdr6A: array[120] of Decimal;
        VessEndr: Decimal;
        T0001: Label 'Budget';
        T0002: Label 'Actual';
        T0003: Label 'Variance';
        "--------": Integer;
        JbLe: Record "Job Ledger Entry";
        JbLe1: Record "Job Ledger Entry";
        JbBe: Record "Job catch Default";
        JbBe1: Record "Job catch Default";
        Vale: Record "Value Entry";
        Vale1: Record "Value Entry";
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        FILTERSCaptionLbl: Label 'FILTERS';
        Control1000000167CaptionLbl: Label 'Label1000000167';
        Control1000000168CaptionLbl: Label 'Label1000000168';
        Control1000000169CaptionLbl: Label 'Label1000000169';
        Control1000000170CaptionLbl: Label 'Label1000000170';
        Control1000000171CaptionLbl: Label 'Label1000000171';
        Control1000000172CaptionLbl: Label 'Label1000000172';
        Control1000000173CaptionLbl: Label 'Label1000000173';
        VarianceCaptionLbl: Label 'Variance';
        ActualCaptionLbl: Label 'Actual';
        BudgetCaptionLbl: Label 'Budget';
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
        BudgetCaption_Control1000000249Lbl: Label 'Budget';
        ActualCaption_Control1000000244Lbl: Label 'Actual';
        VarianceCaption_Control1000000285Lbl: Label 'Variance';
        VarianceCaption_Control1000000334Lbl: Label 'Variance';
        ActualCaption_Control1000000447Lbl: Label 'Actual';
        BudgetCaption_Control1000000448Lbl: Label 'Budget';
        VarianceCaption_Control1000000450Lbl: Label 'Variance';
        ActualCaption_Control1000000451Lbl: Label 'Actual';
        BudgetCaption_Control1000000452Lbl: Label 'Budget';
        VarianceCaption_Control1000000454Lbl: Label 'Variance';
        ActualCaption_Control1000000455Lbl: Label 'Actual';
        BudgetCaption_Control1000000621Lbl: Label 'Budget';
        PortDay_Control1000000609CaptionLbl: Label 'Port Day';
        LostDay_Control1000000611CaptionLbl: Label 'Lost At Sea';
        FishgDay_Control1000000613CaptionLbl: Label 'Fishing Day';
        ETAConsCaptionLbl: Label 'ETA';
        VessEndrCaptionLbl: Label 'Endurance';
        SkipperCaptionLbl: Label 'Skipper';
        BudgetCaption_Control1000000446Lbl: Label 'Budget';
        ActualCaption_Control1000000445Lbl: Label 'Actual';
        VarianceCaption_Control1000000286Lbl: Label 'Variance';
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

    local procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[50]; Bold: Boolean; Italic: Boolean; UnderLine: Boolean)
    begin
        TempExcelBuffer.Init;
        TempExcelBuffer.Validate("Row No.", RowNo);
        TempExcelBuffer.Validate("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.Italic := Italic;
        TempExcelBuffer.Underline := UnderLine;
        if not TempExcelBuffer.Insert then TempExcelBuffer.Modify;
    end;

    [Scope('Internal')]
    procedure CellDefLn()
    begin
        ColumnNo := 1 + (level * 3);
        if SeaRangeCVar[level] <> 0 then EnterCell(RowNo, ColumnNo, Format(SeaRangeCVar[level]), false, false, false);
        if SeaRangeC[level] <> 0 then EnterCell(RowNo, ColumnNo - 1, Format(SeaRangeC[level]), false, false, false);
        if SeaRangeCBud[level] <> 0 then EnterCell(RowNo, ColumnNo - 2, Format(SeaRangeCBud[level]), false, false, false);

        if level = 1 then begin
            if T[3] <> 0 then EnterCell(RowNo, ColumnNo, Format(T[3]), false, false, false);
            if T[2] <> 0 then EnterCell(RowNo, ColumnNo - 1, Format(T[2]), false, false, false);
            if T[1] <> 0 then EnterCell(RowNo, ColumnNo - 2, Format(T[1]), false, false, false);
            EnterCell(RowNo, 1, RwLabel, false, false, false); //Row Label (Caption)
        end;
    end;

    [Scope('Internal')]
    procedure CellDefVT(RowN: Integer; Varn: Decimal; Actl: Decimal; Budg: Decimal; TotNo: Integer)
    begin
        ColumnNo := 1 + (level * 3);
        if SeaRangeCVar[level] <> 0 then EnterCell(RowN, ColumnNo, Format(Varn), false, false, false);
        if SeaRangeC[level] <> 0 then EnterCell(RowN, ColumnNo - 1, Format(Actl), false, false, false);
        if SeaRangeCBud[level] <> 0 then EnterCell(RowN, ColumnNo - 2, Format(Budg), false, false, false);

        if level = 1 then begin
            if VT[TotNo, 3] <> 0 then EnterCell(RowN, ColumnNo, Format(VT[TotNo, 3]), false, false, false);
            if VT[TotNo, 2] <> 0 then EnterCell(RowN, ColumnNo - 1, Format(VT[TotNo, 2]), false, false, false);
            if VT[TotNo, 1] <> 0 then EnterCell(RowN, ColumnNo - 2, Format(VT[TotNo, 1]), false, false, false);
            EnterCell(RowN, 1, RwLabel, false, false, false); //Row Label (Caption)
        end;
    end;

    [Scope('Internal')]
    procedure CellDefHd()
    begin
        RowNo := 5;
        ColumnNo := 1 + (Countx * 3);
        EnterCell(RowNo, ColumnNo, T0003, false, false, false);
        EnterCell(RowNo, ColumnNo - 1, T0002, false, false, false);
        EnterCell(RowNo, ColumnNo - 2, T0001, false, false, false);

        if Countx = 2 then begin
            EnterCell(7, 1, 'Skipper', false, false, false);
            EnterCell(8, 1, 'Endurance', false, false, false);
            EnterCell(9, 1, 'ETA', false, false, false);
            EnterCell(10, 1, 'Fishing Day', false, false, false);
            EnterCell(11, 1, 'Lost At Sea', false, false, false);
            EnterCell(12, 1, 'Port Day', false, false, false);

            //EnterCell(7,2,FORMAT(T[]),FALSE,FALSE,FALSE);
            EnterCell(8, 2, Format(HDT[2]), false, false, false);
            EnterCell(9, 2, Format(HDTd[1]), false, false, false);
            EnterCell(10, 2, Format(HDT[4]), false, false, false);
            EnterCell(11, 2, Format(HDT[5]), false, false, false);
            EnterCell(12, 2, Format(HDT[6]), false, false, false);
        end;
    end;

    [Scope('Internal')]
    procedure BIN()
    begin
    end;

    [Scope('Internal')]
    procedure "Bin 2"()
    begin
    end;
}

