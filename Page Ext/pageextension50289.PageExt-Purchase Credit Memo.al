pageextension 50289 pageextension50289 extends "Purchase Credit Memo"
{
    layout
    {
        modify("No.")
        {
            Visible = true;
        }

        //Unsupported feature: Property Modification (ImplicitType) on ""Ship-to City"(Control 38)".


        //Unsupported feature: Property Modification (ImplicitType) on ""Pay-to City"(Control 28)".

    }
    var
        purchLine: Record "Purchase Line";
        purchHeader: Record "Purchase Header";
        PurchSetup: Record "Purchases & Payables Setup";
        PurchCalcDisc: Codeunit "Purch.-Calc.Discount";
}

