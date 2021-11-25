report 90005 "VARIANT CLASS  UPDATE"
{
    DefaultLayout = RDLC;
    RDLCLayout = './VARIANTCLASSUPDATE.rdlc';

    dataset
    {
        dataitem(Item; Item)
        {
            column(Item_No_; "No.")
            {
            }
            dataitem("Product Group"; "Product Group")
            {
                RequestFilterFields = "Item Category Code";
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
                column(Product_Group_Code; Code)
                {
                }
                column(Product_Group_Description; Description)
                {
                }
                column(Product_GroupCaption; Product_GroupCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Product_Group_CodeCaption; FieldCaption(Code))
                {
                }
                column(Product_Group_DescriptionCaption; FieldCaption(Description))
                {
                }
                column(Product_Group_Item_Category_Code; "Item Category Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IVAR.Init;
                    IVAR."Item No." := Item."No.";
                    IVAR.Code := "Product Group".Code;
                    if not IVAR.Insert() then IVAR.Modify();
                end;
            }
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
        IVAR: Record "Item Variant";
        Product_GroupCaptionLbl: Label 'Product Group';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

