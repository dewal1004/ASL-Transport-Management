report 99231 "job tex"
{
    // Countg
    DefaultLayout = RDLC;
    RDLCLayout = './jobtex.rdlc';


    dataset
    {
        dataitem(Job; Job)
        {
            DataItemTableView = SORTING ("Points Sort Bay", Status) ORDER(Descending) WHERE (Status = CONST ("Voyage Start"), "No." = FILTER ('I' .. 'K'));
            RequestFilterFields = "Points Sort Bay";
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
            column(Job__Points_Sort_Bay_; "Points Sort Bay")
            {
            }
            column(Job__No__; "No.")
            {
            }
            column(Job_Vessel; Vessel)
            {
            }
            column(Job_Points; Points)
            {
            }
            column(Job__Points_Sort_Bay__Control1000000000; "Points Sort Bay")
            {
            }
            column(Countg; Countg)
            {
            }
            column(TotalFor___FIELDCAPTION__Points_Sort_Bay__; TotalFor + FieldCaption("Points Sort Bay"))
            {
            }
            column(Job_Points_Control20; Points)
            {
            }
            column(JobCaption; JobCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Job__No__Caption; FieldCaption("No."))
            {
            }
            column(Job_VesselCaption; FieldCaption(Vessel))
            {
            }
            column(Job_PointsCaption; FieldCaption(Points))
            {
            }
            column(Job__Points_Sort_Bay_Caption; FieldCaption("Points Sort Bay"))
            {
            }
            column(Job__Points_Sort_Bay__Control1000000000Caption; FieldCaption("Points Sort Bay"))
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Points Sort Bay");

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
        TotalFor: Label 'Total for ';
        Countg: Integer;
        JobCaptionLbl: Label 'Job';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

