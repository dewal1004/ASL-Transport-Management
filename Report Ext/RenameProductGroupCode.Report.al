report 90995 "Rename Product Group Code"
{
    DefaultLayout = RDLC;
    RDLCLayout = './RenameProductGroupCode.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
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
            column(Item__Item_Category_Code_; "Item Category Code")
            {
            }
            column(Item__Product_Group_Code_; "Product Group Code")
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
            column(Item__Item_Category_Code_Caption; FieldCaption("Item Category Code"))
            {
            }
            column(Item__Product_Group_Code_Caption; FieldCaption("Product Group Code"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Item."Product Group Code" = 'SHRIMP' then Item."Product Group Code" := 'SHR';
                if Item."Product Group Code" = 'FISH' then Item."Product Group Code" := 'FIS';
                if Item."Product Group Code" = 'HOOK' then Item."Product Group Code" := 'HK';
                Item.Modify;
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
        ItemCaptionLbl: Label 'Item';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

