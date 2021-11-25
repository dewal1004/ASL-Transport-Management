table 50044 "Fish Shop Daily Sales"
{
    DrillDownPageID = "Fishshop Daily sales";
    LookupPageID = "Fishshop Daily sales";

    fields
    {
        field(1; "Document No"; Code[10])
        {
        }
        field(2; "Item No."; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(3; Description; Text[50])
        {
        }
        field(4; Location; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(5; "Transaction Date"; Date)
        {
        }
        field(6; Quantity; Decimal)
        {
        }
        field(7; "Unit Price"; Decimal)
        {
        }
        field(8; Amount; Decimal)
        {
        }
        field(9; "Payment Type"; Code[10])
        {
            TableRelation = "Payment Method".Code;
        }
        field(10; Processed; Boolean)
        {
        }
        field(11; "Day Sale Qty"; Decimal)
        {
            CalcFormula = Sum ("Fish Shop Daily Sales".Quantity WHERE ("Item No." = FIELD ("Item No."),
                                                                      Location = FIELD (Location),
                                                                      "Transaction Date" = FIELD ("Transaction Date"),
                                                                      "Payment Type" = FIELD ("Payment Type")));
            FieldClass = FlowField;
        }
        field(12; "Day Sale Value"; Decimal)
        {
            CalcFormula = Sum ("Fish Shop Daily Sales".Amount WHERE ("Item No." = FIELD ("Item No."),
                                                                    Location = FIELD (Location),
                                                                    "Transaction Date" = FIELD ("Transaction Date"),
                                                                    "Payment Type" = FIELD ("Payment Type")));
            FieldClass = FlowField;
        }
        field(13; "Cust No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Item No.", Location, "Transaction Date", "Payment Type")
        {
            SumIndexFields = Quantity, Amount;
        }
        key(Key2; "Item No.", Location, "Transaction Date", "Payment Type")
        {
            Clustered = true;
            SumIndexFields = Quantity, Amount;
        }
    }

    fieldgroups
    {
    }

    var
        Location: Record Location;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        FishshopDay: Record "Fish Shop Daily Sales";

    local procedure GenerateDailysale()
    begin
    end;
}

