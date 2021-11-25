report 59997 "New Daily Points Report Fast12"
{
    // UNL-ASL3.60.01.004 (Santus) May 11, 2005
    // -> modified report to write output data to the Entry/Exit Table. the data will be stored as historical data.
    DefaultLayout = RDLC;
    RDLCLayout = './NewDailyPointsReportFast12.rdlc';

    Caption = 'New Daily Points Report';

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));

            trigger OnAfterGetRecord()
            begin

                if not Historical then begin
                    JobsPointVal.SetCurrentKey(JobsPointVal.Vessel, JobsPointVal.Status);
                    JobsPointVal.SetRange(JobsPointVal.Status, 2);
                end;

                if RepDate <> 0D then
                    JobsPointVal.SetFilter(JobsPointVal."Date Filter", '%1', RepDate)
                else
                    JobsPointVal.SetFilter(JobsPointVal."Date Filter", '%1..%2', 19800101D, Today);

                //MESSAGE('Report Date is %1',RepDate);
                if JobsPointVal.Find('-') then
                    repeat
                        //JobsPointVal.CALCFIELDS(JobsPointVal.Points);
                        //IF JobsPointVal.Points <>0 THEN ; //MESSAGE('Val is %1',JobsPointVal.Points);
                        JobsPointVal."Points Sort Bay" := JobsPointVal.PointZ(JobsPointVal."No.", '',
                           JobsPointVal.GetFilter("Date Filter"), '', '', '', JobsPointVal.Vessel);//JobsPointVal.Points;
                        JobsPointVal.Modify();
                    until JobsPointVal.Next = 0;
            end;
        }
        dataitem(Job; Job)
        {
            DataItemTableView = SORTING ("Points Sort Bay", Status) ORDER(Descending) WHERE ("No." = FILTER ('I' .. 'K'));
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(Consolidated_Daily_Points_Report_As_On_____FORMAT_Workdat_0_4_; 'Consolidated Daily Points Report As On : ' + Format(Workdat, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Day_of_Tide____DOT; 'Day of Tide: ' + DOT)
            {
            }
            column(Countz; Countz)
            {
            }
            column(Desc; Desc)
            {
            }
            column(Job__Fishing_Country_Code_; "Fishing Country Code")
            {
            }
            column(Skipper; Skipper)
            {
            }
            column(SeArea; SeArea)
            {
            }
            column(SeTemp; SeTemp)
            {
            }
            column(pts_1_; pts[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_3_; pts[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_2_; pts[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_7_; pts[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_8_; pts[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_9_; pts[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_4_; pts[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_5_; pts[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_6_; pts[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaDays; SeaDays)
            {
            }
            column(TotPts_1_; TotPts[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPts_2_; TotPts[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPts_3_; TotPts[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPts_4_; TotPts[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPts_5_; TotPts[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPts_6_; TotPts[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPts_7_; TotPts[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPts_8_; TotPts[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPts_9_; TotPts[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_1_; TotPtsA[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_2_; TotPtsA[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_3_; TotPtsA[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_4_; TotPtsA[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_5_; TotPtsA[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_6_; TotPtsA[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_7_; TotPtsA[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_8_; TotPtsA[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotPtsA_9_; TotPtsA[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaDaysTot; SeaDaysTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaTempA; SeaTempA)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaDayA; SeaDayA)
            {
                DecimalPlaces = 0 : 0;
            }
            column(OperationCaption; OperationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Sr__No_Caption; Sr__No_CaptionLbl)
            {
            }
            column(VesselCaption; VesselCaptionLbl)
            {
            }
            column(CountryCaption; CountryCaptionLbl)
            {
            }
            column(SkipperCaption; SkipperCaptionLbl)
            {
            }
            column(Sea_DaysCaption; Sea_DaysCaptionLbl)
            {
            }
            column(AreaCaption; AreaCaptionLbl)
            {
            }
            column(Sea_Temp__CCaption; Sea_Temp__CCaptionLbl)
            {
            }
            column(Shrimp_PtsCaption; Shrimp_PtsCaptionLbl)
            {
            }
            column(Fish_PtsCaption; Fish_PtsCaptionLbl)
            {
            }
            column(PtsCaption; PtsCaptionLbl)
            {
            }
            column(Fish_PtsCaption_Control1000000010; Fish_PtsCaption_Control1000000010Lbl)
            {
            }
            column(Shrimp_PtsCaption_Control1000000011; Shrimp_PtsCaption_Control1000000011Lbl)
            {
            }
            column(Day_PtsCaption; Day_PtsCaptionLbl)
            {
            }
            column(Fish_PtsCaption_Control1000000016; Fish_PtsCaption_Control1000000016Lbl)
            {
            }
            column(Shrimp_PtsCaption_Control1000000017; Shrimp_PtsCaption_Control1000000017Lbl)
            {
            }
            column(PtsCaption_Control1000000031; PtsCaption_Control1000000031Lbl)
            {
            }
            column(DaysCaption; DaysCaptionLbl)
            {
            }
            column(CumulativeCaption; CumulativeCaptionLbl)
            {
            }
            column(AverageCaption; AverageCaptionLbl)
            {
            }
            column(AVERAGECaption_Control1000000043; AVERAGECaption_Control1000000043Lbl)
            {
            }
            column(TOTALCaption; TOTALCaptionLbl)
            {
            }
            column(Job_No_; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin

                if ((pts[1] = 0) and (pts[2] = 0) and (not NoCatch)) then
                    CurrReport.ShowOutput(false)
                else begin
                    SeaDaysTot := SeaDaysTot + SeaDays;
                    Countz := Countz + 1;
                    I := 0;
                    repeat
                        I := I + 1;
                        TotPts[I] := TotPts[I] + pts[I];
                        if pts[I] <> 0 then
                            CountCum[I] := CountCum[I] + 1;
                        //MESSAGE('Value for row %1 Col %2 is %3',Countz,I,CountCum[I]);
                    until I = 9;
                    Eval := Evaluate(SeTempVal, SeTemp);
                    SeaTemp := SeaTemp + SeTempVal;
                    if Resource.Get(Job."Person Responsible") then
                        Skipper := Resource.Name
                    else
                        Skipper := "Person Responsible";
                end;
                if Loc.Get(Vessel) then
                    Desc := Loc.Name;
                HistoricalData.Reset;
                if CurrReport.ShowOutput then begin
                    HistoricalData.SetRange(HistoricalData."Report Type", HistoricalData."Report Type"::Points);
                    HistoricalData.SetRange(HistoricalData.Date, RepDate);
                    HistoricalData.SetRange(HistoricalData.Vessel, Desc);
                    HistoricalData.SetRange(HistoricalData.Type, HistoricalData.Type::" ");
                    if HistoricalData.Find('-') then begin
                        HistoricalData."Day Fish Pts" := pts[1];
                        HistoricalData."Day Shrimp Pts" := pts[2];
                        HistoricalData."Day Points" := pts[3];
                        HistoricalData."Cumm. Fish Pts" := pts[4];
                        HistoricalData."Cumm. Shrimp Pts" := pts[5];
                        HistoricalData."Cumm. Total Pts" := pts[6];
                        HistoricalData."Avg Fish Pts" := pts[7];
                        HistoricalData."Avg Shrimp Pts" := pts[8];
                        HistoricalData."Total Avg Pts" := pts[9];
                        HistoricalData.Modify;
                    end else begin

                        HistoricalData.Init;
                        HistoricalData."Report Type" := HistoricalData."Report Type"::Points;
                        HistoricalData.Date := RepDate;
                        HistoricalData.Vessel := Desc;
                        HistoricalData.Type := 0;
                        HistoricalData.Country := Job."Fishing Country Code";
                        HistoricalData.Skipper := Skipper;
                        HistoricalData."Sea Days" := SeaDays;
                        HistoricalData."Sea Area" := SeArea;
                        HistoricalData."Day Fish Pts" := pts[1];
                        HistoricalData."Day Shrimp Pts" := pts[2];
                        HistoricalData."Day Points" := pts[3];
                        HistoricalData."Cumm. Fish Pts" := pts[4];
                        HistoricalData."Cumm. Shrimp Pts" := pts[5];
                        HistoricalData."Cumm. Total Pts" := pts[6];
                        HistoricalData."Avg Fish Pts" := pts[7];
                        HistoricalData."Avg Shrimp Pts" := pts[8];
                        HistoricalData."Total Avg Pts" := pts[9];
                        HistoricalData.Insert(true);
                    end;
                end;

                k := 0;
                repeat
                    k := k + 1;
                    if CountCum[k] <> 0 then TotPtsA[k] := TotPts[k] / CountCum[k] else TotPtsA[k] := 0;
                until k = 9;

                if Countz <> 0 then begin
                    SeaTempA := SeaTemp / Countz;
                    SeaDayA := Round(SeaDaysTot / Countz, 1, '<');
                end
                else begin
                    SeaTempA := 0;
                    SeaDayA := 0;
                end;
            end;

            trigger OnPostDataItem()
            begin
                SetFilter(AvgPtSortBay, '<>0');
                SetFilter("Points Sort Bay", '<>0');
                SetRange("Fishing Country Code", '');
                //MESSAGE('Total no of Rec %1',COUNT);
                Medn := Round(Count / 2, 1, '<');
                //Sort Data Based on Average Points
                SetCurrentKey(AvgPtSortBay);
                if Find('+') then;
                Next(-Medn);
                MednVoy[2] := "No.";

                /*IF ((ROUND(COUNT/2,1,'>'))-(ROUND(COUNT/2,1,'<')))=0 THEN
                NEXT(-1);
                MednVoy[1]:="No.";
                //MESSAGE('Voyages are %1 and %2',MednVoy[1],MednVoy[2])
                */

                k := 0;
                repeat
                    k := k + 1;
                    if CountCum[k] <> 0 then TotPtsA[k] := TotPtsAvg[k] / CountCum[k] else TotPtsA[k] := 0;
                until k = 9;

            end;

            trigger OnPreDataItem()
            begin
                /*IF RepDate<>0D THEN Workdat:=RepDate
                ELSE Workdat:=TODAY;
                
                j:=1;
                REPEAT
                 pts[j]:=0;
                 j:=j+1;
                UNTIL j = 10;
                
                job1.GET(Job."No.");
                //job1.SETRANGE(job1."Task Filter");
                job1.SETRANGE(job1."Date Filter");
                
                JobLdgr.SETCURRENTKEY(JobLdgr."Job No.",JobLdgr."Posting Date");
                JobLdgr.SETFILTER(JobLdgr."Job No.",job1."No.");
                JobLdgr.SETRANGE(JobLdgr."Posting Date",0D,Workdat);
                JobLdgr.SETRANGE(JobLdgr.Type,0,1);
                IF JobLdgr.FIND('+') THEN
                BEGIN
                  //SeTemp:= JobLdgr."Step Code";
                  SeArea:=JobLdgr."Phase Code";
                END
                ELSE
                BEGIN
                  SeTemp:='';
                  SeArea:='';
                END;
                
                
                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job1.SETRANGE(job1."Date Filter",0D,Workdat);
                //job1.CALCFIELDS(job1.Points);
                pts[6]:= job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','','',job1.Vessel);  //job1.Points;
                
                //job1.SETFILTER(job1."Task Filter",'SHR');
                //job1.CALCFIELDS(job1.Points);
                pts[5]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','SHR','',job1.Vessel);//job1.Points;
                
                //job1.SETFILTER(job1."Task Filter",'FIS');
                //job1.CALCFIELDS(job1.Points);
                pts[4]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','FIS','',job1.Vessel); //job1.Points;
                
                //Average
                //AAA* IF  job1."Starting Date"<>0D THEN SeaDays:=TODAY-job1."Starting Date" ELSE SeaDays:=0;
                IF job1."Starting Date"<>0D THEN SeaDays:=Workdat-job1."Starting Date" ELSE SeaDays:=0;
                IF SeaDays<>0 THEN
                BEGIN
                  pts[9]:=pts[6]/SeaDays;
                  pts[8]:=pts[5]/SeaDays;
                  pts[7]:=pts[4]/SeaDays
                END;
                AvgPtSortBay:=pts[9];
                MODIFY;
                
                //Daily
                job1.SETFILTER(job1."Date Filter",'=%1',Workdat);
                //job1.SETRANGE(job1."Task Filter");
                //job1.CALCFIELDS(job1.Points);
                pts[3]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','','',job1.Vessel);//job1.Points;
                
                //job1.SETFILTER(job1."Task Filter",'SHR');
                //job1.CALCFIELDS(job1.Points);
                pts[2]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','SHR','',job1.Vessel);//job1.Points;
                
                //job1.SETFILTER(job1."Task Filter",'FIS');
                //job1.CALCFIELDS(job1.Points);
                pts[1]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','FIS','',job1.Vessel);//job1.Points;
                
                //No Catch Record Exist
                //job1.SETRANGE(job1."Task Filter");
                //job1.SETRANGE(job1."Type Filter",0);
                job1.CALCFIELDS(job1.NoCatchExist);
                NoCatch:=job1.NoCatchExist;
                
                //SeaDaysTot:=SeaDaysTot+SeaDays;
                
                */


                if not Historical then SetRange(Status, 2);
                SetFilter(AvgPtSortBay, '<>0');
                if Find('-') then
                    repeat
                        AvgPtSortBay := 0;
                        Modify();
                    until Next = 0;
                SetFilter(AvgPtSortBay, '');
                if Find('-') then;

            end;
        }
        dataitem(Job2; Job)
        {
            DataItemTableView = SORTING ("Fishing Country Code", AvgPtSortBay) ORDER(Descending) WHERE ("No." = FILTER ('I' .. 'K'));
            column(Job2__Fishing_Country_Code_; "Fishing Country Code")
            {
            }
            column(Job2__Fishing_Country_Code__Control1000000060; "Fishing Country Code")
            {
            }
            column(Job2_Vessel; Vessel)
            {
            }
            column(Job2__No__; "No.")
            {
            }
            column(CountJ; CountJ)
            {
            }
            column(pts_1__Control1000000064; pts[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_2__Control1000000065; pts[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_3__Control1000000066; pts[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_4__Control1000000067; pts[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_5__Control1000000068; pts[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_6__Control1000000069; pts[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_7__Control1000000070; pts[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_8__Control1000000071; pts[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_9__Control1000000072; pts[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(UPPERCASE_FishCountry_; UpperCase(FishCountry))
            {
            }
            column(CountJ_Control1000000050; CountJ)
            {
            }
            column(pts_1__Control1000000051; pts[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_2__Control1000000052; pts[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_3__Control1000000053; pts[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_4__Control1000000054; pts[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_5__Control1000000055; pts[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_6__Control1000000056; pts[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_7__Control1000000057; pts[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_8__Control1000000058; pts[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_9__Control1000000059; pts[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_10_; pts[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(AverageCaption_Control1000000075; AverageCaption_Control1000000075Lbl)
            {
            }
            column(Job2__Fishing_Country_Code_Caption; FieldCaption("Fishing Country Code"))
            {
            }

            trigger OnAfterGetRecord()
            begin

                CurrReport.ShowOutput :=
                  CurrReport.TotalsCausedBy = Job2.FieldNo("Fishing Country Code");
                if CurrReport.TotalsCausedBy = Job2.FieldNo("Fishing Country Code") then
                    CountJx := CountJ;
                CountJ := 0;

                CurrReport.ShowOutput(false);

                CurrReport.ShowOutput(false);
                //CurrReport.SHOWOUTPUT(Pts[3]<>0);
                if pts[3] <> 0 then CountJ := CountJ + 1;


                CurrReport.ShowOutput :=
                  CurrReport.TotalsCausedBy = Job2.FieldNo("Fishing Country Code");
                if CountJ <> 0 then begin
                    j := 1;
                    repeat
                        pts[j] := pts[j] / CountJ;
                        j := j + 1;
                    until j = 11;
                end;

                if "Fishing Country Code" = '' then
                    FishCountry := 'NIGERIA'
                else
                    if Country.Get("Fishing Country Code") then
                        FishCountry := Country.Name;

                HistoricalData.Reset;
                if CurrReport.ShowOutput and (CountJ <> 0) then begin
                    HistoricalData.SetRange(HistoricalData."Report Type", HistoricalData."Report Type"::Points);
                    HistoricalData.SetRange(HistoricalData.Date, RepDate);
                    HistoricalData.SetRange(HistoricalData.Country, FishCountry);
                    HistoricalData.SetRange(HistoricalData.Type, HistoricalData.Type::Average);
                    if HistoricalData.Find('-') then begin
                        HistoricalData."Vessel Count" := CountJ;
                        HistoricalData."Day Fish Pts" := pts[1];
                        HistoricalData."Day Shrimp Pts" := pts[2];
                        HistoricalData."Day Points" := pts[3];
                        HistoricalData."Cumm. Fish Pts" := pts[4];
                        HistoricalData."Cumm. Shrimp Pts" := pts[5];
                        HistoricalData."Cumm. Total Pts" := pts[6];
                        HistoricalData."Avg Fish Pts" := pts[7];
                        HistoricalData."Avg Shrimp Pts" := pts[8];
                        HistoricalData."Total Avg Pts" := pts[9];
                        HistoricalData."Sea Days" := pts[10];
                        HistoricalData.Modify;
                    end else begin
                        HistoricalData.Init;
                        HistoricalData."Report Type" := HistoricalData."Report Type"::Points;
                        HistoricalData.Date := RepDate;
                        HistoricalData.Type := HistoricalData.Type::Average;
                        HistoricalData.Country := UpperCase(FishCountry);
                        HistoricalData."Sea Days" := pts[10];
                        HistoricalData."Day Fish Pts" := pts[1];
                        HistoricalData."Day Shrimp Pts" := pts[2];
                        HistoricalData."Day Points" := pts[3];
                        HistoricalData."Cumm. Fish Pts" := pts[4];
                        HistoricalData."Cumm. Shrimp Pts" := pts[5];
                        HistoricalData."Cumm. Total Pts" := pts[6];
                        HistoricalData."Avg Fish Pts" := pts[7];
                        HistoricalData."Avg Shrimp Pts" := pts[8];
                        HistoricalData."Total Avg Pts" := pts[9];
                        HistoricalData.Insert(true);
                    end;
                end;

                /*IF RepDate<>0D THEN Workdat:=RepDate
                ELSE Workdat:=TODAY;
                
                j:=1;
                REPEAT
                 pts[j]:=0;
                 j:=j+1;
                UNTIL j = 11;
                
                job3.GET(Job2."No.");
                //job3.SETRANGE(job3."Task Filter");
                job3.SETRANGE(job3."Date Filter");
                
                JobLdgr.SETCURRENTKEY(JobLdgr."Job No.",JobLdgr."Posting Date");
                JobLdgr.SETFILTER(JobLdgr."Job No.",job3."No.");
                JobLdgr.SETRANGE(JobLdgr."Posting Date",0D,Workdat);
                JobLdgr.SETRANGE(JobLdgr.Type,0,1);
                IF JobLdgr.FIND('+') THEN
                BEGIN
                  //SeTemp:= JobLdgr."Step Code";
                  SeArea:=JobLdgr."Phase Code";
                END
                ELSE
                BEGIN
                  SeTemp:='';
                  SeArea:='';
                END;
                
                
                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job3.SETRANGE(job3."Date Filter",0D,Workdat);
                //job3.CALCFIELDS(job3.Points);
                pts[6]:=job3.PointZ(job3."No.",'',job3.GETFILTER("Date Filter"),'','','',job3.Vessel);//job3.Points;
                
                
                //job3.SETFILTER(job3."Task Filter",'SHR');
                //job3.CALCFIELDS(job3.Points);
                pts[5]:=job3.PointZ(job3."No.",'',job3.GETFILTER("Date Filter"),'','SHR','',job3.Vessel);//job3.Points;
                
                //job3.SETFILTER(job3."Task Filter",'FIS');
                //job3.CALCFIELDS(job3.Points);
                pts[4]:=job3.PointZ(job3."No.",'',job3.GETFILTER("Date Filter"),'','FIS','',job3.Vessel);//job3.Points;
                
                
                //Average
                //AAA* IF  job3."Starting Date"<>0D THEN SeaDays:=TODAY-job3."Starting Date" ELSE SeaDays:=0;
                IF job3."Starting Date"<>0D THEN SeaDays:=Workdat-job3."Starting Date" ELSE SeaDays:=0;
                IF SeaDays<>0 THEN
                BEGIN
                  pts[9]:=pts[6]/SeaDays;
                  pts[8]:=pts[5]/SeaDays;
                  pts[7]:=pts[4]/SeaDays
                END;
                
                //Daily
                job3.SETFILTER(job3."Date Filter",'=%1',Workdat);
                //job3.SETRANGE(job3."Task Filter");
                //job3.CALCFIELDS(job3.Points);
                pts[3]:=job3.PointZ(job3."No.",'',job3.GETFILTER("Date Filter"),'','','',job3.Vessel);//job3.Points;
                
                //job3.SETFILTER(job3."Task Filter",'SHR');
                //job3.CALCFIELDS(job3.Points);
                pts[2]:=job3.PointZ(job3."No.",'',job3.GETFILTER("Date Filter"),'','SHR','',job3.Vessel);//job3.Points;
                
                //job3.SETFILTER(job3."Task Filter",'FIS');
                //job3.CALCFIELDS(job3.Points);
                pts[1]:=job3.PointZ(job3."No.",'',job3.GETFILTER("Date Filter"),'','FIS','',job3.Vessel);//job3.Points;
                
                IF pts[3]=0 THEN CurrReport.SKIP;
                
                //No Catch Record Exist
                //job3.SETRANGE(job3."Task Filter");
                //job3.SETRANGE(job3."Type Filter",0);
                job3.CALCFIELDS(job3.NoCatchExist);
                NoCatch:=job3.NoCatchExist;
                
                pts[10]:=SeaDays;
                
                
                 */ //#1

            end;

            trigger OnPreDataItem()
            begin
                if not Historical then SetRange(Status, 2);
                LastFieldNo := FieldNo("Fishing Country Code");
                //Job2.SETFILTER(Job2."Date Filter",'%1',040104D);
                j := 1;
                repeat CurrReport.CreateTotals(pts[j]); j := j + 1; until j = 11;
            end;
        }
        dataitem(VoyMedian; Job)
        {
            DataItemTableView = SORTING ("Points Sort Bay", Status) ORDER(Descending) WHERE ("No." = FILTER ('I' .. 'K'));
            column(Desc_Control1000000077; Desc)
            {
            }
            column(VoyMedian__Fishing_Country_Code_; "Fishing Country Code")
            {
            }
            column(Skipper_Control1000000079; Skipper)
            {
            }
            column(SeaDays_Control1000000080; SeaDays)
            {
            }
            column(SeArea_Control1000000081; SeArea)
            {
            }
            column(pts_1__Control1000000082; pts[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_2__Control1000000083; pts[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_3__Control1000000084; pts[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_4__Control1000000085; pts[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_5__Control1000000086; pts[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_6__Control1000000087; pts[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_7__Control1000000088; pts[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_8__Control1000000089; pts[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_9__Control1000000090; pts[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_1__Control1000000091; pts[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_2__Control1000000092; pts[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_3__Control1000000093; pts[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_4__Control1000000094; pts[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_5__Control1000000095; pts[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_6__Control1000000096; pts[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_7__Control1000000097; pts[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_8__Control1000000098; pts[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(pts_9__Control1000000099; pts[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(Median_NigeriaCaption; Median_NigeriaCaptionLbl)
            {
            }
            column(VoyMedian_No_; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                job1.GET("No.");
                //job1.SETRANGE(job1."Task Filter");
                job1.SETRANGE(job1."Date Filter");
                
                JobLdgr.SETCURRENTKEY(JobLdgr."Job No.",JobLdgr."Posting Date");
                JobLdgr.SETFILTER(JobLdgr."Job No.",job1."No.");
                JobLdgr.SETRANGE(JobLdgr."Posting Date",0D,Workdat);
                JobLdgr.SETRANGE(JobLdgr.Type,0,1);
                IF JobLdgr.FIND('+') THEN
                BEGIN
                  //SeTemp:= JobLdgr."Step Code";
                  SeArea:=JobLdgr."Phase Code";
                END
                ELSE
                BEGIN
                  SeTemp:='';
                  SeArea:='';
                END;
                
                
                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job1.SETRANGE(job1."Date Filter",0D,Workdat);
                //job1.CALCFIELDS(job1.Points);
                pts[6]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','','',job1.Vessel);//job1.Points;
                
                //job1.SETFILTER(job1."Task Filter",'SHR');
                //job1.CALCFIELDS(job1.Points);
                pts[5]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','SHR','',job1.Vessel);//job1.Points;
                
                //job1.SETFILTER(job1."Task Filter",'FIS');
                //job1.CALCFIELDS(job1.Points);
                pts[4]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','FIS','',job1.Vessel);//job1.Points;
                
                //Average
                //AAA* IF  job1."Starting Date"<>0D THEN SeaDays:=TODAY-job1."Starting Date" ELSE SeaDays:=0;
                IF job1."Starting Date"<>0D THEN SeaDays:=Workdat-job1."Starting Date" ELSE SeaDays:=0;
                IF SeaDays<>0 THEN
                BEGIN
                  pts[9]:=pts[6]/SeaDays;
                  pts[8]:=pts[5]/SeaDays;
                  pts[7]:=pts[4]/SeaDays
                END;
                
                //Daily
                job1.SETFILTER(job1."Date Filter",'=%1',Workdat);
                //job1.SETRANGE(job1."Task Filter");
                //job1.CALCFIELDS(job1.Points);
                pts[3]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','','',job1.Vessel);//job1.Points;
                
                //job1.SETFILTER(job1."Task Filter",'SHR');
                //job1.CALCFIELDS(job1.Points);
                pts[2]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','SHR','',job1.Vessel);//job1.Points;
                
                //job1.SETFILTER(job1."Task Filter",'FIS');
                //job1.CALCFIELDS(job1.Points);
                pts[1]:=job1.PointZ(job1."No.",'',job1.GETFILTER("Date Filter"),'','FIS','',job1.Vessel);//job1.Points;
                
                 //#1
                 */

            end;

            trigger OnPreDataItem()
            begin
                if not Historical then SetRange(Status, 2);
                VoyMedian.SetFilter(VoyMedian."No.", '%1|%2', MednVoy[1], MednVoy[2]);
                j := 1;
                repeat CurrReport.CreateTotals(pts[j]); j := j + 1; until j = 10;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(RepDate; RepDate)
                {

                    trigger OnValidate()
                    begin

                        if DOTrec.Get(RepDate) then begin
                            DOTrec."Day of tide" := DOT;
                            DOTrec.Modify;
                        end
                        else begin
                            DOTrec.Date := RepDate;
                            DOTrec."Day of tide" := DOT;
                            DOTrec.Insert;
                        end;
                    end;
                }
                field("Day Of Tide"; DOT)
                {
                }
                field(Historical; Historical)
                {
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        job1: Record Job;
        JobLdgr: Record "Job Ledger Entry";
        DOTrec: Record "Day of Tide";
        JobsPointVal: Record Job;
        Resource: Record Resource;
        Loc: Record Location;
        NoCatch: Boolean;
        Eval: Boolean;
        SeaDays: Integer;
        I: Integer;
        j: Integer;
        k: Integer;
        Countz: Integer;
        pts: array[10] of Decimal;
        TotPts: array[9] of Decimal;
        TotPtsA: array[9] of Decimal;
        TotPtsAvg: array[9] of Decimal;
        SeaDaysTot: Decimal;
        SeaDayA: Integer;
        CountCum: array[9] of Decimal;
        SeaTemp: Decimal;
        SeaTempA: Decimal;
        SeTempVal: Decimal;
        Skipper: Text[30];
        Desc: Text[30];
        SeTemp: Code[10];
        SeArea: Code[10];
        DOT: Code[15];
        Workdat: Date;
        RepDate: Date;
        "------------": Integer;
        Country: Record "Country/Region";
        job3: Record Job;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FishCountry: Text[100];
        Medn: Decimal;
        MednVoy: array[2] of Code[10];
        CountJ: Integer;
        CountJx: Integer;
        PntsAvg: Decimal;
        Historical: Boolean;
        HistoricalData: Record "Entry/Exit Point";
        OperationCaptionLbl: Label 'Operation';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Sr__No_CaptionLbl: Label 'Sr. No.';
        VesselCaptionLbl: Label 'Vessel';
        CountryCaptionLbl: Label 'Country';
        SkipperCaptionLbl: Label 'Skipper';
        Sea_DaysCaptionLbl: Label 'Sea Days';
        AreaCaptionLbl: Label 'Area';
        Sea_Temp__CCaptionLbl: Label 'Sea Temp. C';
        Shrimp_PtsCaptionLbl: Label 'Shrimp Pts';
        Fish_PtsCaptionLbl: Label 'Fish Pts';
        PtsCaptionLbl: Label 'Pts';
        Fish_PtsCaption_Control1000000010Lbl: Label 'Fish Pts';
        Shrimp_PtsCaption_Control1000000011Lbl: Label 'Shrimp Pts';
        Day_PtsCaptionLbl: Label 'Day Pts';
        Fish_PtsCaption_Control1000000016Lbl: Label 'Fish Pts';
        Shrimp_PtsCaption_Control1000000017Lbl: Label 'Shrimp Pts';
        PtsCaption_Control1000000031Lbl: Label 'Pts';
        DaysCaptionLbl: Label 'Days';
        CumulativeCaptionLbl: Label 'Cumulative';
        AverageCaptionLbl: Label 'Average';
        AVERAGECaption_Control1000000043Lbl: Label 'AVERAGE';
        TOTALCaptionLbl: Label 'TOTAL';
        AverageCaption_Control1000000075Lbl: Label 'Average';
        Median_NigeriaCaptionLbl: Label 'Median Nigeria';
}

