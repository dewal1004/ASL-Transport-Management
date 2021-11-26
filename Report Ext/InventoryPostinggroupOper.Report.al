report 90997 "Inventory Posting group Oper."
{
    DefaultLayout = RDLC;
    RDLCLayout = './InventoryPostinggroupOper.rdlc';

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
            column(ProdOrderExist; ProdOrderExistCaptionLbl)
            {
            }
            column(Item__Inventory_Posting_Group_; "Inventory Posting Group")
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
            column(ProdOrderExistCaption; ProdOrderExistCaptionLbl)
            {
            }
            column(Item__Inventory_Posting_Group_Caption; FieldCaption("Inventory Posting Group"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                InvtPostGrp.Code := Item."No.";
                InvtPostGrp.Description := DelChr(Item.Description, '<>', '(2-KGS)');
                InvtPostGrp."Group Type" := 1;
                if not InvtPostGrp.Insert then InvtPostGrp.Modify;
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
        InvtPostGrp: Record "Inventory Posting Group";
        ItemCaptionLbl: Label 'Item';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        ProdOrderExistCaptionLbl: Label 'Label15';
}

