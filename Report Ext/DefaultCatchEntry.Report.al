report 90996 "Default Catch Entry"
{
    DefaultLayout = RDLC;
    RDLCLayout = './DefaultCatchEntry.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", Field7;
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
            column(Item__No__; "No.")
            {
            }
            column(Item__No__2_; "No. 2")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item__Search_Description_; "Search Description")
            {
            }
            column(Item__Description_2_; "Description 2")
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item__No__Caption; FieldCaption("No."))
            {
            }
            column(Item__No__2_Caption; FieldCaption("No. 2"))
            {
            }
            column(Item_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Item__Search_Description_Caption; FieldCaption("Search Description"))
            {
            }
            column(Item__Description_2_Caption; FieldCaption("Description 2"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*InitCatch.INIT;
                InitCatch."Rec No.":=Item."No.";
                InitCatch."Training Course Code":='2.00';
                InitCatch."Course name":='PR7S';
                InitCatch."Statistics Group":=Item."Statistics Group";
                IF NOT InitCatch.INSERT THEN InitCatch.MODIFY;*///MA

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
        InitCatch: Record "Course Attendance";
        ItemCaptionLbl: Label 'Item';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

