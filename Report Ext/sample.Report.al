report 76457 sample
{
    DefaultLayout = RDLC;
    RDLCLayout = './sample.rdlc';

    dataset
    {
        dataitem(Job; Job)
        {
            DataItemTableView = SORTING ("Voyage Sea Days", "Revenue per Sea Day", Vessel);
            RequestFilterFields = "Voyage Sea Days";
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
            column(Job__Voyage_Sea_Days_; "Voyage Sea Days")
            {
            }
            column(Job__No__; "No.")
            {
            }
            column(Job__Ending_Date_; "Ending Date")
            {
            }
            column(Job__Revenue_per_Sea_Day_; "Revenue per Sea Day")
            {
            }
            column(Job_Vessel; Vessel)
            {
            }
            column(Job__Voyage_Sea_Days__Control1000000023; "Voyage Sea Days")
            {
            }
            column(TotalFor___FIELDCAPTION__Voyage_Sea_Days__; TotalFor + FieldCaption("Voyage Sea Days"))
            {
            }
            column(Job__Revenue_per_Sea_Day__Control1000000026; "Revenue per Sea Day")
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
            column(Job__Ending_Date_Caption; FieldCaption("Ending Date"))
            {
            }
            column(Job__Revenue_per_Sea_Day_Caption; FieldCaption("Revenue per Sea Day"))
            {
            }
            column(Job_VesselCaption; FieldCaption(Vessel))
            {
            }
            column(Job__Voyage_Sea_Days__Control1000000023Caption; FieldCaption("Voyage Sea Days"))
            {
            }
            column(Job__Voyage_Sea_Days_Caption; FieldCaption("Voyage Sea Days"))
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Voyage Sea Days");

                if not FooterPrinted then
                    LastFieldNo := CurrReport.TotalsCausedBy;
                CurrReport.ShowOutput := not FooterPrinted;
                if FooterPrinted then
                    ExcelBuffer.AddColumn('Posting Date', false, '', false, false, false, '', 0);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control2)
                {
                    ShowCaption = false;
                    field(FooterPrinted; FooterPrinted)
                    {
                        ShowCaption = false;
                    }
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

    trigger OnPostReport()
    begin
        //ExcelBuffer.CreateBook();
        //ExcelBuffer.CreateBookAndOpenExcel('Sales','Test',COMPANYNAME,USERID,'');
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        JobCaptionLbl: Label 'Job';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        ExcelBuffer: Record "Excel Buffer";
}

