report 90017 "Job Catch Reconciliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './JobCatchReconciliation.rdlc';

    dataset
    {
        dataitem("Job Ledger Entry"; "Job Ledger Entry")
        {
            DataItemTableView = SORTING ("Job No.", "Location Code", "Work Type Code", "No.") WHERE ("Location Code" = FILTER ('CRM-ASL'), Type = CONST (Item));
            RequestFilterFields = "Job No.";
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
            column(Job_Ledger_Entry__Job_No__; "Job No.")
            {
            }
            column(Job_Ledger_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Job_Ledger_Entry_Type; Type)
            {
            }
            column(Job_Ledger_Entry__No__; "No.")
            {
            }
            column(Job_Ledger_Entry_Quantity; Quantity)
            {
            }
            column(Job_Ledger_Entry_GroupSort; GroupSort)
            {
            }
            column(Job_Ledger_Entry_Quantity_Control1000000000; Quantity)
            {
            }
            column(Job_Ledger_EntryCaption; Job_Ledger_EntryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Job_Ledger_Entry__Job_No__Caption; FieldCaption("Job No."))
            {
            }
            column(Job_Ledger_Entry__Posting_Date_Caption; FieldCaption("Posting Date"))
            {
            }
            column(Job_Ledger_Entry_TypeCaption; FieldCaption(Type))
            {
            }
            column(Job_Ledger_Entry__No__Caption; FieldCaption("No."))
            {
            }
            column(Job_Ledger_Entry_QuantityCaption; FieldCaption(Quantity))
            {
            }
            column(Job_Ledger_Entry_GroupSortCaption; FieldCaption(GroupSort))
            {
            }
            column(Job_Ledger_Entry_Entry_No_S; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                iCount := iCount + 1;
                Window.Update(1, Round(iCount / RecCount * 10000, 1));
            end;

            trigger OnPostDataItem()
            begin
                //Window.CLOSE;
            end;

            trigger OnPreDataItem()
            begin
                JobLedgerEntry.CopyFilters("Job Ledger Entry");
                JobLedgerEntry.SetCurrentKey("Job No.", "Location Code", "Work Type Code", "No.");
                RecCount := JobLedgerEntry.Count;
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

    trigger OnInitReport()
    begin
        Bold := true;
        UnderLine := true;
        Italic := true;
        TopPage := true;
        PageOrientation := 1;
        FontSize := 7;
    end;

    trigger OnPostReport()
    begin
        if Send2Excel then
            Clear(xlApp);
    end;

    var
        xlApp: Automation BC;
        xlBook: Automation BC;
        xlSheet: Automation BC;
        Send2Excel: Boolean;
        TopPage: Boolean;
        Xr: Integer;
        Xc: Integer;
        Bold: Boolean;
        UnderLine: Boolean;
        Italic: Boolean;
        FontSize: Integer;
        PageOrientation: Option "Excel Default",Portrait,Landscape;
        Window: Dialog;
        RecCount: Integer;
        iCount: Integer;
        JobLedgerEntry: Record "Job Ledger Entry";
        Job_Ledger_EntryCaptionLbl: Label 'Job Ledger Entry';
        CurrReport_PAGENOCaptionLbl: Label 'Page';

    [Scope('Internal')]
    procedure UpdateCell(Row: Integer; Col: Integer; ValueText: Text[200]; Bold: Boolean; Italic: Boolean; Underline: Boolean; FontSize: Integer)
    begin
        xlSheet.Range(GetCol(Col) + Format(Row)).Value := ValueText;
        if Bold then
            xlSheet.Range(GetCol(Col) + Format(Row)).Font.Bold := Bold;
        if Italic then
            xlSheet.Range(GetCol(Col) + Format(Row)).Font.Italic := Italic;
        if Underline then
            xlSheet.Range(GetCol(Col) + Format(Row)).Font.Underline := Underline;
        xlSheet.Range(GetCol(Col) + Format(Row)).Font.Size := FontSize;
    end;

    [Scope('Internal')]
    procedure GetCol(CN: Integer): Text[30]
    var
        xlColID: Text[10];
        x: Integer;
        c: Integer;
        i: Integer;
    begin
        xlColID := '';
        if CN <> 0 then begin
            x := CN - 1;
            c := 65 + x mod 26;
            xlColID[10] := c;
            i := 10;
            while x > 25 do begin
                x := x div 26;
                i := i - 1;
                c := 64 + x mod 26;
                xlColID[i] := c;
            end;
            for x := i to 10 do
                xlColID[1 + x - i] := xlColID[x];
        end;
        exit(xlColID);
    end;
}

