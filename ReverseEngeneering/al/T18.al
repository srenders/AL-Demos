table 18 Customer
{
    // version NAVW111.00,NAVBE11.00

    CaptionML = ENU='Customer',
                FRB='Client',
                NLB='Klant';
    DataCaptionFields = "No.",Name;
    DrillDownPageID = "Customer List";
    LookupPageID = "Customer List";
    Permissions = TableData "Cust. Ledger Entry"=r,
                  TableData Job=r,
                  TableData "VAT Registration Log"=rd,
                  TableData "Service Header"=r,
                  TableData "Service Item"=rm,
                  TableData "Service Contract Header"=rm,
                  TableData "Sales Price"=rd,
                  TableData "Sales Line Discount"=rd;

    fields
    {
        field(1;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRB='N°',
                        NLB='Nr.';

            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                  SalesSetup.GET;
                  NoSeriesMgt.TestManual(SalesSetup."Customer Nos.");
                  "No. Series" := '';
                end;
                if "Invoice Disc. Code" = '' then
                  "Invoice Disc. Code" := "No.";
            end;
        }
        field(2;Name;Text[50])
        {
            CaptionML = ENU='Name',
                        FRB='Nom',
                        NLB='Naam';

            trigger OnValidate();
            begin
                if ("Search Name" = UPPERCASE(xRec.Name)) or ("Search Name" = '') then
                  "Search Name" := Name;
            end;
        }
        field(3;"Search Name";Code[50])
        {
            CaptionML = ENU='Search Name',
                        FRB='Nom de recherche',
                        NLB='Zoeknaam';
        }
        field(4;"Name 2";Text[50])
        {
            CaptionML = ENU='Name 2',
                        FRB='Nom 2',
                        NLB='Naam 2';
        }
        field(5;Address;Text[50])
        {
            CaptionML = ENU='Address',
                        FRB='Adresse',
                        NLB='Adres';
        }
        field(6;"Address 2";Text[50])
        {
            CaptionML = ENU='Address 2',
                        FRB='Adresse (2ème ligne)',
                        NLB='Adres 2';
        }
        field(7;City;Text[30])
        {
            CaptionML = ENU='City',
                        FRB='Ville',
                        NLB='Plaats';
            TableRelation = IF ("Country/Region Code"=CONST('')) "Post Code".City
                            ELSE IF ("Country/Region Code"=FILTER(<>'')) "Post Code".City WHERE ("Country/Region Code"=FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) and GUIALLOWED);
            end;
        }
        field(8;Contact;Text[50])
        {
            CaptionML = ENU='Contact',
                        FRB='Contact',
                        NLB='Contact';

            trigger OnLookup();
            var
                ContactBusinessRelation : Record "Contact Business Relation";
                Cont : Record Contact;
            begin
                if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Customer,"No.") then
                  Cont.SETRANGE("Company No.",ContactBusinessRelation."Contact No.")
                else
                  Cont.SETRANGE("Company No.",'');

                if "Primary Contact No." <> '' then
                  if Cont.GET("Primary Contact No.") then ;
                if PAGE.RUNMODAL(0,Cont) = ACTION::LookupOK then
                  VALIDATE("Primary Contact No.",Cont."No.");
            end;

            trigger OnValidate();
            begin
                if RMSetup.GET then
                  if RMSetup."Bus. Rel. Code for Customers" <> '' then
                    if (xRec.Contact = '') and (xRec."Primary Contact No." = '') and (Contact <> '') then begin
                      MODIFY;
                      UpdateContFromCust.OnModify(Rec);
                      UpdateContFromCust.InsertNewContactPerson(Rec,false);
                      MODIFY(true);
                    end
            end;
        }
        field(9;"Phone No.";Text[30])
        {
            CaptionML = ENU='Phone No.',
                        FRB='N° téléphone',
                        NLB='Telefoon';
            ExtendedDatatype = PhoneNo;
        }
        field(10;"Telex No.";Text[20])
        {
            CaptionML = ENU='Telex No.',
                        FRB='N° télex',
                        NLB='Telex';
        }
        field(11;"Document Sending Profile";Code[20])
        {
            CaptionML = ENU='Document Sending Profile',
                        FRB='Profil d''envoi de documents',
                        NLB='Verzendprofiel van document';
            TableRelation = "Document Sending Profile".Code;
        }
        field(14;"Our Account No.";Text[20])
        {
            CaptionML = ENU='Our Account No.',
                        FRB='Notre n° cpte/fourn.',
                        NLB='Ons rekeningnr.';
        }
        field(15;"Territory Code";Code[10])
        {
            CaptionML = ENU='Territory Code',
                        FRB='Code secteur',
                        NLB='Regio';
            TableRelation = Territory;
        }
        field(16;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            CaptionML = ENU='Global Dimension 1 Code',
                        FRB='Code axe principal 1',
                        NLB='Code globale dimensie 1';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(17;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            CaptionML = ENU='Global Dimension 2 Code',
                        FRB='Code axe principal 2',
                        NLB='Code globale dimensie 2';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(18;"Chain Name";Code[10])
        {
            CaptionML = ENU='Chain Name',
                        FRB='Nom du groupe',
                        NLB='Bedrijf/Groep';
        }
        field(19;"Budgeted Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Budgeted Amount',
                        FRB='Montant budgété',
                        NLB='Budget (Bedrag)';
        }
        field(20;"Credit Limit (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Credit Limit (LCY)',
                        FRB='Crédit autorisé DS',
                        NLB='Kredietlimiet (LV)';
        }
        field(21;"Customer Posting Group";Code[20])
        {
            CaptionML = ENU='Customer Posting Group',
                        FRB='Groupe compta. client',
                        NLB='Klantboekingsgroep';
            TableRelation = "Customer Posting Group";
        }
        field(22;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRB='Code devise',
                        NLB='Valutacode';
            TableRelation = Currency;

            trigger OnValidate();
            begin
                UpdateCurrencyId;
            end;
        }
        field(23;"Customer Price Group";Code[10])
        {
            CaptionML = ENU='Customer Price Group',
                        FRB='Groupe prix client',
                        NLB='Klantenprijsgroep';
            TableRelation = "Customer Price Group";
        }
        field(24;"Language Code";Code[10])
        {
            CaptionML = ENU='Language Code',
                        FRB='Code langue',
                        NLB='Taal';
            TableRelation = Language;
        }
        field(26;"Statistics Group";Integer)
        {
            CaptionML = ENU='Statistics Group',
                        FRB='Groupe statistiques',
                        NLB='Statistiekgroep';
        }
        field(27;"Payment Terms Code";Code[10])
        {
            CaptionML = ENU='Payment Terms Code',
                        FRB='Code conditions paiement',
                        NLB='Betalingscondities';
            TableRelation = "Payment Terms";

            trigger OnValidate();
            begin
                UpdatePaymentTermsId;
            end;
        }
        field(28;"Fin. Charge Terms Code";Code[10])
        {
            CaptionML = ENU='Fin. Charge Terms Code',
                        FRB='Code condition intérêts',
                        NLB='Rentefactuurconditie';
            TableRelation = "Finance Charge Terms";
        }
        field(29;"Salesperson Code";Code[20])
        {
            CaptionML = ENU='Salesperson Code',
                        FRB='Code vendeur',
                        NLB='Verkoper';
            TableRelation = "Salesperson/Purchaser";
        }
        field(30;"Shipment Method Code";Code[10])
        {
            CaptionML = ENU='Shipment Method Code',
                        FRB='Code condition livraison',
                        NLB='Verzendwijze';
            TableRelation = "Shipment Method";

            trigger OnValidate();
            begin
                UpdateShipmentMethodId;
            end;
        }
        field(31;"Shipping Agent Code";Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services"=R;
            CaptionML = ENU='Shipping Agent Code',
                        FRB='Code transporteur',
                        NLB='Expediteur';
            TableRelation = "Shipping Agent";

            trigger OnValidate();
            begin
                if "Shipping Agent Code" <> xRec."Shipping Agent Code" then
                  VALIDATE("Shipping Agent Service Code",'');
            end;
        }
        field(32;"Place of Export";Code[20])
        {
            CaptionML = ENU='Place of Export',
                        FRB='Lieu d''exportation',
                        NLB='Vertrekplaats';
        }
        field(33;"Invoice Disc. Code";Code[20])
        {
            CaptionML = ENU='Invoice Disc. Code',
                        FRB='Code remise facture',
                        NLB='Factuurkortingscode';
            TableRelation = Customer;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(34;"Customer Disc. Group";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group',
                        FRB='Groupe rem. client',
                        NLB='Klantenkortingsgroep';
            TableRelation = "Customer Discount Group";
        }
        field(35;"Country/Region Code";Code[10])
        {
            CaptionML = ENU='Country/Region Code',
                        FRB='Code pays/région',
                        NLB='Land-/regiocode';
            TableRelation = "Country/Region";

            trigger OnValidate();
            begin
                PostCode.ValidateCountryCode(City,"Post Code",County,"Country/Region Code");
                if "Country/Region Code" <> xRec."Country/Region Code" then
                  VATRegistrationValidation;
            end;
        }
        field(36;"Collection Method";Code[20])
        {
            CaptionML = ENU='Collection Method',
                        FRB='Mode de recouvrement',
                        NLB='Inningsmethode';
        }
        field(37;Amount;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Amount',
                        FRB='Montant',
                        NLB='Bedrag';
        }
        field(38;Comment;Boolean)
        {
            CalcFormula = Exist("Comment Line" WHERE ("Table Name"=CONST(Customer),
                                                      "No."=FIELD("No.")));
            CaptionML = ENU='Comment',
                        FRB='Commentaires',
                        NLB='Opmerking';
            Editable = false;
            FieldClass = FlowField;
        }
        field(39;Blocked;Option)
        {
            CaptionML = ENU='Blocked',
                        FRB='Bloqué',
                        NLB='Geblokkeerd';
            OptionCaptionML = ENU=' ,Ship,Invoice,All',
                              FRB=' ,Livrer,Facturer,Tous',
                              NLB=' ,Verzending,Factuur,Alle';
            OptionMembers = " ",Ship,Invoice,All;

            trigger OnValidate();
            var
                CustLedgerEntry : Record "Cust. Ledger Entry";
                AccountingPeriod : Record "Accounting Period";
                IdentityManagement : Codeunit "Identity Management";
            begin
                if not IdentityManagement.IsInvAppId then
                  exit;

                CustLedgerEntry.RESET;
                CustLedgerEntry.SETCURRENTKEY("Customer No.","Posting Date");
                CustLedgerEntry.SETRANGE("Customer No.","No.");
                AccountingPeriod.SETRANGE(Closed,false);
                if AccountingPeriod.FINDFIRST then
                  CustLedgerEntry.SETFILTER("Posting Date",'>=%1',AccountingPeriod."Starting Date");
                if not CustLedgerEntry.ISEMPTY then
                  ERROR(CannotDeleteBecauseInInvErr,TABLECAPTION);
            end;
        }
        field(40;"Invoice Copies";Integer)
        {
            CaptionML = ENU='Invoice Copies',
                        FRB='Nombre exemplaires facture',
                        NLB='Factuurexemplaren';
        }
        field(41;"Last Statement No.";Integer)
        {
            CaptionML = ENU='Last Statement No.',
                        FRB='N° dern. relevé',
                        NLB='Laatste afschriftnr.';
        }
        field(42;"Print Statements";Boolean)
        {
            CaptionML = ENU='Print Statements',
                        FRB='Imprimer relevés',
                        NLB='Rekeningoverzichten';
        }
        field(45;"Bill-to Customer No.";Code[20])
        {
            CaptionML = ENU='Bill-to Customer No.',
                        FRB='N° client facturé',
                        NLB='Factureren aan';
            TableRelation = Customer;
        }
        field(46;Priority;Integer)
        {
            CaptionML = ENU='Priority',
                        FRB='Priorité',
                        NLB='Prioriteit';
        }
        field(47;"Payment Method Code";Code[10])
        {
            CaptionML = ENU='Payment Method Code',
                        FRB='Code mode de règlement',
                        NLB='Betalingswijze';
            TableRelation = "Payment Method";

            trigger OnValidate();
            var
                PaymentMethod : Record "Payment Method";
            begin
                UpdatePaymentMethodId;

                if "Payment Method Code" = '' then
                  exit;

                PaymentMethod.GET("Payment Method Code");
                if PaymentMethod."Direct Debit" and ("Payment Terms Code" = '') then
                  VALIDATE("Payment Terms Code",PaymentMethod."Direct Debit Pmt. Terms Code");
            end;
        }
        field(53;"Last Modified Date Time";DateTime)
        {
            CaptionML = ENU='Last Modified Date Time',
                        FRB='Date-heure dernière modification',
                        NLB='Datum/tijd van laatste wijziging';
            Editable = false;
        }
        field(54;"Last Date Modified";Date)
        {
            CaptionML = ENU='Last Date Modified',
                        FRB='Date dern. modification',
                        NLB='Gewijzigd op';
            Editable = false;
        }
        field(55;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRB='Filtre date',
                        NLB='Datumfilter';
            FieldClass = FlowFilter;
        }
        field(56;"Global Dimension 1 Filter";Code[20])
        {
            CaptionClass = '1,3,1';
            CaptionML = ENU='Global Dimension 1 Filter',
                        FRB='Filtre axe principal 1',
                        NLB='Filter globale dimensie 1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(1));
        }
        field(57;"Global Dimension 2 Filter";Code[20])
        {
            CaptionClass = '1,3,2';
            CaptionML = ENU='Global Dimension 2 Filter',
                        FRB='Filtre axe principal 2',
                        NLB='Filter globale dimensie 2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No."=CONST(2));
        }
        field(58;Balance;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Customer No."=FIELD("No."),
                                                                         "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Balance',
                        FRB='Solde',
                        NLB='Saldo';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59;"Balance (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Balance (LCY)',
                        FRB='Solde DS',
                        NLB='Saldo (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60;"Net Change";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Customer No."=FIELD("No."),
                                                                         "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                         "Posting Date"=FIELD("Date Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Net Change',
                        FRB='Solde période',
                        NLB='Mutatie';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61;"Net Change (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Posting Date"=FIELD("Date Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Net Change (LCY)',
                        FRB='Solde période DS',
                        NLB='Mutatie (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62;"Sales (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Cust. Ledger Entry"."Sales (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                        "Global Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                        "Posting Date"=FIELD("Date Filter"),
                                                                        "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Sales (LCY)',
                        FRB='Ventes DS',
                        NLB='Verkoop (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(63;"Profit (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Cust. Ledger Entry"."Profit (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                         "Global Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                         "Global Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                         "Posting Date"=FIELD("Date Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Profit (LCY)',
                        FRB='Marge DS',
                        NLB='Winst (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(64;"Inv. Discounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Cust. Ledger Entry"."Inv. Discount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                "Global Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                                "Posting Date"=FIELD("Date Filter"),
                                                                                "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Inv. Discounts (LCY)',
                        FRB='Remises facture DS',
                        NLB='Factuurkorting (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65;"Pmt. Discounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                  "Entry Type"=FILTER("Payment Discount"..'"Payment Discount (VAT Adjustment)"'),
                                                                                  "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                  "Posting Date"=FIELD("Date Filter"),
                                                                                  "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Pmt. Discounts (LCY)',
                        FRB='Escomptes DS',
                        NLB='Contantkorting (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(66;"Balance Due";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Customer No."=FIELD("No."),
                                                                         "Posting Date"=FIELD(UPPERLIMIT("Date Filter")),
                                                                         "Initial Entry Due Date"=FIELD(UPPERLIMIT("Date Filter")),
                                                                         "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Balance Due',
                        FRB='Solde dû',
                        NLB='Openstaand saldo';
            Editable = false;
            FieldClass = FlowField;
        }
        field(67;"Balance Due (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                 "Posting Date"=FIELD(UPPERLIMIT("Date Filter")),
                                                                                 "Initial Entry Due Date"=FIELD(UPPERLIMIT("Date Filter")),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Balance Due (LCY)',
                        FRB='Solde dû DS',
                        NLB='Openstaand saldo (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(69;Payments;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type"=CONST(Payment),
                                                                          "Entry Type"=CONST("Initial Entry"),
                                                                          "Customer No."=FIELD("No."),
                                                                          "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                          "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                          "Posting Date"=FIELD("Date Filter"),
                                                                          "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Payments',
                        FRB='Paiements',
                        NLB='Betalingen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70;"Invoice Amounts";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type"=CONST(Invoice),
                                                                         "Entry Type"=CONST("Initial Entry"),
                                                                         "Customer No."=FIELD("No."),
                                                                         "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                         "Posting Date"=FIELD("Date Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Invoice Amounts',
                        FRB='Montants factures',
                        NLB='Facturen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(71;"Cr. Memo Amounts";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type"=CONST("Credit Memo"),
                                                                          "Entry Type"=CONST("Initial Entry"),
                                                                          "Customer No."=FIELD("No."),
                                                                          "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                          "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                          "Posting Date"=FIELD("Date Filter"),
                                                                          "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Cr. Memo Amounts',
                        FRB='Montants avoirs',
                        NLB='Creditnota''s';
            Editable = false;
            FieldClass = FlowField;
        }
        field(72;"Finance Charge Memo Amounts";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type"=CONST("Finance Charge Memo"),
                                                                         "Entry Type"=CONST("Initial Entry"),
                                                                         "Customer No."=FIELD("No."),
                                                                         "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                         "Posting Date"=FIELD("Date Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Finance Charge Memo Amounts',
                        FRB='Montants intérêts de retard',
                        NLB='Rentefacturen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(74;"Payments (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type"=CONST(Payment),
                                                                                  "Entry Type"=CONST("Initial Entry"),
                                                                                  "Customer No."=FIELD("No."),
                                                                                  "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                  "Posting Date"=FIELD("Date Filter"),
                                                                                  "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Payments (LCY)',
                        FRB='Paiements DS',
                        NLB='Betalingen (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(75;"Inv. Amounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type"=CONST(Invoice),
                                                                                 "Entry Type"=CONST("Initial Entry"),
                                                                                 "Customer No."=FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Posting Date"=FIELD("Date Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Inv. Amounts (LCY)',
                        FRB='Montants factures DS',
                        NLB='Bedragen op facturen (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(76;"Cr. Memo Amounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type"=CONST("Credit Memo"),
                                                                                  "Entry Type"=CONST("Initial Entry"),
                                                                                  "Customer No."=FIELD("No."),
                                                                                  "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                  "Posting Date"=FIELD("Date Filter"),
                                                                                  "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Cr. Memo Amounts (LCY)',
                        FRB='Montants avoirs DS',
                        NLB='Creditnota''s (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(77;"Fin. Charge Memo Amounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type"=CONST("Finance Charge Memo"),
                                                                                 "Entry Type"=CONST("Initial Entry"),
                                                                                 "Customer No."=FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Posting Date"=FIELD("Date Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Fin. Charge Memo Amounts (LCY)',
                        FRB='Montants int. retard DS',
                        NLB='Rentefacturen (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(78;"Outstanding Orders";Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Outstanding Amount" WHERE ("Document Type"=CONST(Order),
                                                                       "Bill-to Customer No."=FIELD("No."),
                                                                       "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                       "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                       "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Outstanding Orders',
                        FRB='Commandes ouvertes',
                        NLB='Openstaande orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(79;"Shipped Not Invoiced";Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Shipped Not Invoiced" WHERE ("Document Type"=CONST(Order),
                                                                         "Bill-to Customer No."=FIELD("No."),
                                                                         "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                         "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Shipped Not Invoiced',
                        FRB='Livré non facturé',
                        NLB='Verzonden/Niet gefact.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(80;"Application Method";Option)
        {
            CaptionML = ENU='Application Method',
                        FRB='Mode de lettrage',
                        NLB='Vereffeningsmethode';
            OptionCaptionML = ENU='Manual,Apply to Oldest',
                              FRB='Manuel,Au plus ancien',
                              NLB='Open posten,Saldo';
            OptionMembers = Manual,"Apply to Oldest";
        }
        field(82;"Prices Including VAT";Boolean)
        {
            CaptionML = ENU='Prices Including VAT',
                        FRB='Prix TTC',
                        NLB='Inclusief btw';
        }
        field(83;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRB='Code magasin',
                        NLB='Vestiging';
            TableRelation = Location WHERE ("Use As In-Transit"=CONST(false));
        }
        field(84;"Fax No.";Text[30])
        {
            CaptionML = ENU='Fax No.',
                        FRB='N° télécopie',
                        NLB='Fax';
        }
        field(85;"Telex Answer Back";Text[20])
        {
            CaptionML = ENU='Telex Answer Back',
                        FRB='Télex retour',
                        NLB='Telexantwoord';
        }
        field(86;"VAT Registration No.";Text[20])
        {
            CaptionML = ENU='VAT Registration No.',
                        FRB='N° identif. intracomm.',
                        NLB='Btw-nummer';

            trigger OnValidate();
            begin
                if ("VAT Registration No." <> '') and Country.DetermineCountry("Country/Region Code") then
                  ERROR(Text11301,FIELDCAPTION("Enterprise No."));

                "VAT Registration No." := UPPERCASE("VAT Registration No.");
                if "VAT Registration No." <> xRec."VAT Registration No." then
                  VATRegistrationValidation;
            end;
        }
        field(87;"Combine Shipments";Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            CaptionML = ENU='Combine Shipments',
                        FRB='Regroupement B.L.',
                        NLB='Verzendingen combineren';
        }
        field(88;"Gen. Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='Gen. Bus. Posting Group',
                        FRB='Groupe compta. marché',
                        NLB='Bedrijfsboekingsgroep';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate();
            begin
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                  if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp,"Gen. Bus. Posting Group") then
                    VALIDATE("VAT Bus. Posting Group",GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;
        }
        field(89;Picture;BLOB)
        {
            CaptionML = ENU='Picture',
                        FRB='illustration',
                        NLB='Foto';
            SubType = Bitmap;
        }
        field(90;GLN;Code[13])
        {
            CaptionML = ENU='GLN',
                        FRB='GLN',
                        NLB='GLN';
            Numeric = true;

            trigger OnValidate();
            var
                GLNCalculator : Codeunit "GLN Calculator";
            begin
                if GLN <> '' then
                  GLNCalculator.AssertValidCheckDigit13(GLN);
            end;
        }
        field(91;"Post Code";Code[20])
        {
            CaptionML = ENU='Post Code',
                        FRB='Code postal',
                        NLB='Postcode';
            TableRelation = IF ("Country/Region Code"=CONST('')) "Post Code"
                            ELSE IF ("Country/Region Code"=FILTER(<>'')) "Post Code" WHERE ("Country/Region Code"=FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) and GUIALLOWED);
            end;
        }
        field(92;County;Text[30])
        {
            CaptionML = ENU='County',
                        FRB='Région',
                        NLB='Provincie';
        }
        field(97;"Debit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Debit Amount" WHERE ("Customer No."=FIELD("No."),
                                                                                 "Entry Type"=FILTER(<>Application),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Posting Date"=FIELD("Date Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Debit Amount',
                        FRB='Montant débit',
                        NLB='Debetbedrag';
            Editable = false;
            FieldClass = FlowField;
        }
        field(98;"Credit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Credit Amount" WHERE ("Customer No."=FIELD("No."),
                                                                                  "Entry Type"=FILTER(<>Application),
                                                                                  "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                  "Posting Date"=FIELD("Date Filter"),
                                                                                  "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Credit Amount',
                        FRB='Montant crédit',
                        NLB='Creditbedrag';
            Editable = false;
            FieldClass = FlowField;
        }
        field(99;"Debit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Debit Amount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                       "Entry Type"=FILTER(<>Application),
                                                                                       "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                       "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                       "Posting Date"=FIELD("Date Filter"),
                                                                                       "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Debit Amount (LCY)',
                        FRB='Montant débit DS',
                        NLB='Debetbedrag (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(100;"Credit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Credit Amount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                        "Entry Type"=FILTER(<>Application),
                                                                                        "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                        "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                        "Posting Date"=FIELD("Date Filter"),
                                                                                        "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Credit Amount (LCY)',
                        FRB='Montant crédit DS',
                        NLB='Creditbedrag (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(102;"E-Mail";Text[80])
        {
            CaptionML = ENU='Email',
                        FRB='Adresse e-mail',
                        NLB='E-mail';
            ExtendedDatatype = EMail;

            trigger OnValidate();
            var
                MailManagement : Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(103;"Home Page";Text[80])
        {
            CaptionML = ENU='Home Page',
                        FRB='Page d''accueil',
                        NLB='Homepage';
            ExtendedDatatype = URL;
        }
        field(104;"Reminder Terms Code";Code[10])
        {
            CaptionML = ENU='Reminder Terms Code',
                        FRB='Code condition relance',
                        NLB='Aanmaningsconditie';
            TableRelation = "Reminder Terms";
        }
        field(105;"Reminder Amounts";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type"=CONST(Reminder),
                                                                         "Entry Type"=CONST("Initial Entry"),
                                                                         "Customer No."=FIELD("No."),
                                                                         "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                         "Posting Date"=FIELD("Date Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Reminder Amounts',
                        FRB='Montants relances',
                        NLB='Aanmaningen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(106;"Reminder Amounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type"=CONST(Reminder),
                                                                                 "Entry Type"=CONST("Initial Entry"),
                                                                                 "Customer No."=FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Posting Date"=FIELD("Date Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Reminder Amounts (LCY)',
                        FRB='Montants relances DS',
                        NLB='Aanmaningen (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(107;"No. Series";Code[20])
        {
            CaptionML = ENU='No. Series',
                        FRB='Souches de n°',
                        NLB='Nr.-reeks';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108;"Tax Area Code";Code[20])
        {
            CaptionML = ENU='Tax Area Code',
                        FRB='Code zone recouvrement',
                        NLB='Tax Area Code';
            TableRelation = "Tax Area";

            trigger OnValidate();
            begin
                UpdateTaxAreaId;
            end;
        }
        field(109;"Tax Liable";Boolean)
        {
            CaptionML = ENU='Tax Liable',
                        FRB='Soumis à recouvrement',
                        NLB='Tax Liable';
        }
        field(110;"VAT Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='VAT Bus. Posting Group',
                        FRB='Groupe compta. marché TVA',
                        NLB='Btw-bedrijfsboekingsgroep';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate();
            begin
                UpdateTaxAreaId;
            end;
        }
        field(111;"Currency Filter";Code[10])
        {
            CaptionML = ENU='Currency Filter',
                        FRB='Filtre devise',
                        NLB='Valutafilter';
            FieldClass = FlowFilter;
            TableRelation = Currency;
        }
        field(113;"Outstanding Orders (LCY)";Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Outstanding Amount (LCY)" WHERE ("Document Type"=CONST(Order),
                                                                             "Bill-to Customer No."=FIELD("No."),
                                                                             "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                             "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                             "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Outstanding Orders (LCY)',
                        FRB='Commandes ouvertes DS',
                        NLB='Openstaande orders (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(114;"Shipped Not Invoiced (LCY)";Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Shipped Not Invoiced (LCY)" WHERE ("Document Type"=CONST(Order),
                                                                               "Bill-to Customer No."=FIELD("No."),
                                                                               "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                               "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Shipped Not Invoiced (LCY)',
                        FRB='Livré non facturé DS',
                        NLB='Verzonden/Niet gefact. (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(115;Reserve;Option)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            CaptionML = ENU='Reserve',
                        FRB='Réserver',
                        NLB='Reserveren';
            InitValue = Optional;
            OptionCaptionML = ENU='Never,Optional,Always',
                              FRB='Jamais,Manuel,Toujours',
                              NLB='Niet,Optioneel,Altijd';
            OptionMembers = Never,Optional,Always;
        }
        field(116;"Block Payment Tolerance";Boolean)
        {
            CaptionML = ENU='Block Payment Tolerance',
                        FRB='Bloquer écart de règlement',
                        NLB='Betalingstolerantie blokkeren';

            trigger OnValidate();
            begin
                UpdatePaymentTolerance((CurrFieldNo <> 0) and GUIALLOWED);
            end;
        }
        field(117;"Pmt. Disc. Tolerance (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                  "Entry Type"=FILTER("Payment Discount Tolerance"|'"Payment Discount Tolerance (VAT Adjustment)"'|'"Payment Discount Tolerance (VAT Excl.)"'),
                                                                                  "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                  "Posting Date"=FIELD("Date Filter"),
                                                                                  "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Pmt. Disc. Tolerance (LCY)',
                        FRB='Validation écart d''escompte DS',
                        NLB='Cont.-kortingstolerantie (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(118;"Pmt. Tolerance (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Customer No."=FIELD("No."),
                                                                                  "Entry Type"=FILTER("Payment Tolerance"|'"Payment Tolerance (VAT Adjustment)"'|'"Payment Tolerance (VAT Excl.)"'),
                                                                                  "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                  "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                  "Posting Date"=FIELD("Date Filter"),
                                                                                  "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Pmt. Tolerance (LCY)',
                        FRB='Écart de règlement DS',
                        NLB='Betalingstolerantie (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(119;"IC Partner Code";Code[20])
        {
            CaptionML = ENU='IC Partner Code',
                        FRB='Code du partenaire IC',
                        NLB='IC-partnercode';
            TableRelation = "IC Partner";

            trigger OnValidate();
            var
                CustLedgEntry : Record "Cust. Ledger Entry";
                AccountingPeriod : Record "Accounting Period";
                ICPartner : Record "IC Partner";
            begin
                if xRec."IC Partner Code" <> "IC Partner Code" then begin
                  if not CustLedgEntry.SETCURRENTKEY("Customer No.",Open) then
                    CustLedgEntry.SETCURRENTKEY("Customer No.");
                  CustLedgEntry.SETRANGE("Customer No.","No.");
                  CustLedgEntry.SETRANGE(Open,true);
                  if CustLedgEntry.FINDLAST then
                    ERROR(Text012,FIELDCAPTION("IC Partner Code"),TABLECAPTION);

                  CustLedgEntry.RESET;
                  CustLedgEntry.SETCURRENTKEY("Customer No.","Posting Date");
                  CustLedgEntry.SETRANGE("Customer No.","No.");
                  AccountingPeriod.SETRANGE(Closed,false);
                  if AccountingPeriod.FINDFIRST then begin
                    CustLedgEntry.SETFILTER("Posting Date",'>=%1',AccountingPeriod."Starting Date");
                    if CustLedgEntry.FINDFIRST then
                      if not CONFIRM(Text011,false,TABLECAPTION) then
                        "IC Partner Code" := xRec."IC Partner Code";
                  end;
                end;

                if "IC Partner Code" <> '' then begin
                  ICPartner.GET("IC Partner Code");
                  if (ICPartner."Customer No." <> '') and (ICPartner."Customer No." <> "No.") then
                    ERROR(Text010,FIELDCAPTION("IC Partner Code"),"IC Partner Code",TABLECAPTION,ICPartner."Customer No.");
                  ICPartner."Customer No." := "No.";
                  ICPartner.MODIFY;
                end;

                if (xRec."IC Partner Code" <> "IC Partner Code") and ICPartner.GET(xRec."IC Partner Code") then begin
                  ICPartner."Customer No." := '';
                  ICPartner.MODIFY;
                end;
            end;
        }
        field(120;Refunds;Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type"=CONST(Refund),
                                                                         "Entry Type"=CONST("Initial Entry"),
                                                                         "Customer No."=FIELD("No."),
                                                                         "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                         "Posting Date"=FIELD("Date Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Refunds',
                        FRB='Remboursements',
                        NLB='Terugbetalingen';
            FieldClass = FlowField;
        }
        field(121;"Refunds (LCY)";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type"=CONST(Refund),
                                                                                 "Entry Type"=CONST("Initial Entry"),
                                                                                 "Customer No."=FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Posting Date"=FIELD("Date Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Refunds (LCY)',
                        FRB='Remboursements DS',
                        NLB='Terugbetalingen (LV)';
            FieldClass = FlowField;
        }
        field(122;"Other Amounts";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE ("Initial Document Type"=CONST(" "),
                                                                         "Entry Type"=CONST("Initial Entry"),
                                                                         "Customer No."=FIELD("No."),
                                                                         "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                         "Posting Date"=FIELD("Date Filter"),
                                                                         "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Other Amounts',
                        FRB='Autres montants',
                        NLB='Andere bedragen';
            FieldClass = FlowField;
        }
        field(123;"Other Amounts (LCY)";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE ("Initial Document Type"=CONST(" "),
                                                                                 "Entry Type"=CONST("Initial Entry"),
                                                                                 "Customer No."=FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Posting Date"=FIELD("Date Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Other Amounts (LCY)',
                        FRB='Autres montants DS',
                        NLB='Andere bedragen (LV)';
            FieldClass = FlowField;
        }
        field(124;"Prepayment %";Decimal)
        {
            CaptionML = ENU='Prepayment %',
                        FRB='% acompte',
                        NLB='Vooruitbetaling %';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(125;"Outstanding Invoices (LCY)";Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Outstanding Amount (LCY)" WHERE ("Document Type"=CONST(Invoice),
                                                                             "Bill-to Customer No."=FIELD("No."),
                                                                             "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                             "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                             "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Outstanding Invoices (LCY)',
                        FRB='Factures en attente DS',
                        NLB='Openstaande facturen (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(126;"Outstanding Invoices";Decimal)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Outstanding Amount" WHERE ("Document Type"=CONST(Invoice),
                                                                       "Bill-to Customer No."=FIELD("No."),
                                                                       "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                       "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                       "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Outstanding Invoices',
                        FRB='Factures en attente',
                        NLB='Openstaande facturen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(130;"Bill-to No. Of Archived Doc.";Integer)
        {
            CalcFormula = Count("Sales Header Archive" WHERE ("Document Type"=CONST(Order),
                                                              "Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-to No. Of Archived Doc.',
                        FRB='Facturation - Nbre de doc. archivés',
                        NLB='Aantal gearchiveerde doc. (facturering)';
            FieldClass = FlowField;
        }
        field(131;"Sell-to No. Of Archived Doc.";Integer)
        {
            CalcFormula = Count("Sales Header Archive" WHERE ("Document Type"=CONST(Order),
                                                              "Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Sell-to No. Of Archived Doc.',
                        FRB='Vente - Nbre de doc. archivés',
                        NLB='Aantal gearchiveerde doc. (order)';
            FieldClass = FlowField;
        }
        field(132;"Partner Type";Option)
        {
            CaptionML = ENU='Partner Type',
                        FRB='Type partenaire',
                        NLB='Partnersoort';
            OptionCaptionML = ENU=' ,Company,Person',
                              FRB=' ,Société,Personne',
                              NLB=' ,Bedrijf,Persoon';
            OptionMembers = " ",Company,Person;
        }
        field(140;Image;Media)
        {
            CaptionML = ENU='Image',
                        FRB='Image',
                        NLB='Afbeelding';
            ExtendedDatatype = Person;
        }
        field(288;"Preferred Bank Account Code";Code[20])
        {
            CaptionML = ENU='Preferred Bank Account Code',
                        FRB='Code de compte bancaire préféré',
                        NLB='Bankrekeningcode van voorkeur';
            TableRelation = "Customer Bank Account".Code WHERE ("Customer No."=FIELD("No."));
        }
        field(840;"Cash Flow Payment Terms Code";Code[10])
        {
            CaptionML = ENU='Cash Flow Payment Terms Code',
                        FRB='Code modalités de paiement de trésorerie',
                        NLB='Code betalingsvoorwaarden cashflow';
            TableRelation = "Payment Terms";
        }
        field(5049;"Primary Contact No.";Code[20])
        {
            CaptionML = ENU='Primary Contact No.',
                        FRB='N° contact principal',
                        NLB='Nr. primair contact';
            TableRelation = Contact;

            trigger OnLookup();
            var
                Cont : Record Contact;
                ContBusRel : Record "Contact Business Relation";
                TempCust : Record Customer temporary;
            begin
                ContBusRel.SETCURRENTKEY("Link to Table","No.");
                ContBusRel.SETRANGE("Link to Table",ContBusRel."Link to Table"::Customer);
                ContBusRel.SETRANGE("No.","No.");
                if ContBusRel.FINDFIRST then
                  Cont.SETRANGE("Company No.",ContBusRel."Contact No.")
                else
                  Cont.SETRANGE("No.",'');

                if "Primary Contact No." <> '' then
                  if Cont.GET("Primary Contact No.") then ;
                if PAGE.RUNMODAL(0,Cont) = ACTION::LookupOK then begin
                  TempCust.COPY(Rec);
                  FIND;
                  TRANSFERFIELDS(TempCust,false);
                  VALIDATE("Primary Contact No.",Cont."No.");
                end;
            end;

            trigger OnValidate();
            var
                Cont : Record Contact;
                ContBusRel : Record "Contact Business Relation";
            begin
                Contact := '';
                if "Primary Contact No." <> '' then begin
                  Cont.GET("Primary Contact No.");

                  ContBusRel.SETCURRENTKEY("Link to Table","No.");
                  ContBusRel.SETRANGE("Link to Table",ContBusRel."Link to Table"::Customer);
                  ContBusRel.SETRANGE("No.","No.");
                  ContBusRel.FINDFIRST;

                  if Cont."Company No." <> ContBusRel."Contact No." then
                    ERROR(Text003,Cont."No.",Cont.Name,"No.",Name);

                  if Cont.Type = Cont.Type::Person then
                    Contact := Cont.Name;

                  if Cont.Image.HASVALUE then
                    CopyContactPicture(Cont);

                  if Cont."Phone No." <> '' then
                    "Phone No." := Cont."Phone No.";
                  if Cont."E-Mail" <> '' then
                    "E-Mail" := Cont."E-Mail";
                end else
                  if Image.HASVALUE then
                    CLEAR(Image);
            end;
        }
        field(5050;"Contact Type";Option)
        {
            CaptionML = ENU='Contact Type',
                        FRB='Type de contact',
                        NLB='Contactsoort';
            OptionCaptionML = ENU='Company,Person',
                              FRB='Société,Personne',
                              NLB='Bedrijf,Persoon';
            OptionMembers = Company,Person;
        }
        field(5700;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRB='Centre de gestion',
                        NLB='Divisie';
            TableRelation = "Responsibility Center";
        }
        field(5750;"Shipping Advice";Option)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            CaptionML = ENU='Shipping Advice',
                        FRB='Option d''expédition',
                        NLB='Verzendadvies';
            OptionCaptionML = ENU='Partial,Complete',
                              FRB='Partielle,Totale',
                              NLB='Gedeeltelijk,Volledig';
            OptionMembers = Partial,Complete;
        }
        field(5790;"Shipping Time";DateFormula)
        {
            AccessByPermission = TableData "Shipping Agent Services"=R;
            CaptionML = ENU='Shipping Time',
                        FRB='Délai d''expédition',
                        NLB='Verzendtijd';
        }
        field(5792;"Shipping Agent Service Code";Code[10])
        {
            CaptionML = ENU='Shipping Agent Service Code',
                        FRB='Code prestation transporteur',
                        NLB='Servicecode expediteur';
            TableRelation = "Shipping Agent Services".Code WHERE ("Shipping Agent Code"=FIELD("Shipping Agent Code"));

            trigger OnValidate();
            begin
                if ("Shipping Agent Code" <> '') and
                   ("Shipping Agent Service Code" <> '')
                then
                  if ShippingAgentService.GET("Shipping Agent Code","Shipping Agent Service Code") then
                    "Shipping Time" := ShippingAgentService."Shipping Time"
                  else
                    EVALUATE("Shipping Time",'<>');
            end;
        }
        field(5900;"Service Zone Code";Code[10])
        {
            CaptionML = ENU='Service Zone Code',
                        FRB='Code zone service',
                        NLB='Serviceregiocode';
            TableRelation = "Service Zone";
        }
        field(5902;"Contract Gain/Loss Amount";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Contract Gain/Loss Entry".Amount WHERE ("Customer No."=FIELD("No."),
                                                                       "Ship-to Code"=FIELD("Ship-to Filter"),
                                                                       "Change Date"=FIELD("Date Filter")));
            CaptionML = ENU='Contract Gain/Loss Amount',
                        FRB='Montant gain/perte contrat',
                        NLB='Winst-/verliesbedrag contract';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5903;"Ship-to Filter";Code[10])
        {
            CaptionML = ENU='Ship-to Filter',
                        FRB='Filtre destinataire',
                        NLB='Verzendfilter';
            FieldClass = FlowFilter;
            TableRelation = "Ship-to Address".Code WHERE ("Customer No."=FIELD("No."));
        }
        field(5910;"Outstanding Serv. Orders (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Service Line"."Outstanding Amount (LCY)" WHERE ("Document Type"=CONST(Order),
                                                                               "Bill-to Customer No."=FIELD("No."),
                                                                               "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                               "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Outstanding Serv. Orders (LCY)',
                        FRB='Commandes serv. ouvertes DS',
                        NLB='Openstaande serviceorders (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5911;"Serv Shipped Not Invoiced(LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Service Line"."Shipped Not Invoiced (LCY)" WHERE ("Document Type"=CONST(Order),
                                                                                 "Bill-to Customer No."=FIELD("No."),
                                                                                 "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                                 "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Serv Shipped Not Invoiced(LCY)',
                        FRB='Serv. livré non facturé DS',
                        NLB='Niet-gefactureerde verzonden services (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5912;"Outstanding Serv.Invoices(LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Service Line"."Outstanding Amount (LCY)" WHERE ("Document Type"=CONST(Invoice),
                                                                               "Bill-to Customer No."=FIELD("No."),
                                                                               "Shortcut Dimension 1 Code"=FIELD("Global Dimension 1 Filter"),
                                                                               "Shortcut Dimension 2 Code"=FIELD("Global Dimension 2 Filter"),
                                                                               "Currency Code"=FIELD("Currency Filter")));
            CaptionML = ENU='Outstanding Serv.Invoices(LCY)',
                        FRB='Factures service en attente DS',
                        NLB='Uitstaande serv.facturen (LV)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7001;"Allow Line Disc.";Boolean)
        {
            CaptionML = ENU='Allow Line Disc.',
                        FRB='Autoriser remise ligne',
                        NLB='Regelkorting berek.';
            InitValue = true;
        }
        field(7171;"No. of Quotes";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST(Quote),
                                                      "Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Quotes',
                        FRB='Nbre de devis',
                        NLB='Aantal offertes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7172;"No. of Blanket Orders";Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST("Blanket Order"),
                                                      "Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Blanket Orders',
                        FRB='Nbre de commandes ouvertes',
                        NLB='Aantal raamcontracten';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7173;"No. of Orders";Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST(Order),
                                                      "Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Orders',
                        FRB='Nbre de commandes',
                        NLB='Aantal orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7174;"No. of Invoices";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST(Invoice),
                                                      "Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Invoices',
                        FRB='Nbre de factures',
                        NLB='Aantal facturen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7175;"No. of Return Orders";Integer)
        {
            AccessByPermission = TableData "Return Receipt Header"=R;
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST("Return Order"),
                                                      "Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Return Orders',
                        FRB='Nbre de retours',
                        NLB='Aantal retourorders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7176;"No. of Credit Memos";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST("Credit Memo"),
                                                      "Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Credit Memos',
                        FRB='Nbre d''avoirs',
                        NLB='Aantal creditnota''s';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7177;"No. of Pstd. Shipments";Integer)
        {
            CalcFormula = Count("Sales Shipment Header" WHERE ("Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Pstd. Shipments',
                        FRB='Nbre d''expéditions enregistrées',
                        NLB='Aantal geboekte verzendingen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7178;"No. of Pstd. Invoices";Integer)
        {
            CalcFormula = Count("Sales Invoice Header" WHERE ("Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Pstd. Invoices',
                        FRB='Nbre de factures enregistrées',
                        NLB='Aantal geboekte facturen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7179;"No. of Pstd. Return Receipts";Integer)
        {
            CalcFormula = Count("Return Receipt Header" WHERE ("Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Pstd. Return Receipts',
                        FRB='Nbre de réceptions retour enregistrées',
                        NLB='Aantal geboekte retourontv.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7180;"No. of Pstd. Credit Memos";Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Header" WHERE ("Sell-to Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Pstd. Credit Memos',
                        FRB='Nbre d''avoirs enregistrés',
                        NLB='Aant. geboekte creditnota''s';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7181;"No. of Ship-to Addresses";Integer)
        {
            CalcFormula = Count("Ship-to Address" WHERE ("Customer No."=FIELD("No.")));
            CaptionML = ENU='No. of Ship-to Addresses',
                        FRB='Nbre d''adresses destinataire',
                        NLB='Aantal verzendadressen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7182;"Bill-To No. of Quotes";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST(Quote),
                                                      "Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Quotes',
                        FRB='Facturation - Nbre de devis',
                        NLB='Factureren: aantal offertes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7183;"Bill-To No. of Blanket Orders";Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST("Blanket Order"),
                                                      "Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Blanket Orders',
                        FRB='Facturation - Nbre de commandes ouvertes',
                        NLB='Factureren: aantal raamorders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7184;"Bill-To No. of Orders";Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header"=R;
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST(Order),
                                                      "Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Orders',
                        FRB='Facturation - Nbre de commandes',
                        NLB='Factureren: aantal orders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7185;"Bill-To No. of Invoices";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST(Invoice),
                                                      "Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Invoices',
                        FRB='Facturation - Nbre de factures',
                        NLB='Factureren: aantal facturen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7186;"Bill-To No. of Return Orders";Integer)
        {
            AccessByPermission = TableData "Return Receipt Header"=R;
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST("Return Order"),
                                                      "Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Return Orders',
                        FRB='Facturation - Nbre de retours',
                        NLB='Factureren: aantal retourorders';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7187;"Bill-To No. of Credit Memos";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE ("Document Type"=CONST("Credit Memo"),
                                                      "Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Credit Memos',
                        FRB='Facturation - Nbre d''avoirs',
                        NLB='Factureren: aantal creditnota''s';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7188;"Bill-To No. of Pstd. Shipments";Integer)
        {
            CalcFormula = Count("Sales Shipment Header" WHERE ("Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Pstd. Shipments',
                        FRB='Facturation - Nbre d''expéditions enregistrées',
                        NLB='Factureren: aantal geboekte verzendingen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7189;"Bill-To No. of Pstd. Invoices";Integer)
        {
            CalcFormula = Count("Sales Invoice Header" WHERE ("Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Pstd. Invoices',
                        FRB='Facturation - Nbre de factures enregistrées',
                        NLB='Factureren: aantal geboekte facturen';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7190;"Bill-To No. of Pstd. Return R.";Integer)
        {
            CalcFormula = Count("Return Receipt Header" WHERE ("Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Pstd. Return R.',
                        FRB='Facturation - Nbre de réceptions retour enregistrées',
                        NLB='Fact.: aantal gebkte ret.ontv.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7191;"Bill-To No. of Pstd. Cr. Memos";Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Header" WHERE ("Bill-to Customer No."=FIELD("No.")));
            CaptionML = ENU='Bill-To No. of Pstd. Cr. Memos',
                        FRB='Facturation - Nbre d''avoirs enregistrés',
                        NLB='Fact.: aant. gebkte CR-nota''s';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7600;"Base Calendar Code";Code[10])
        {
            CaptionML = ENU='Base Calendar Code',
                        FRB='Code calendrier principal',
                        NLB='Basisagendacode';
            TableRelation = "Base Calendar";
        }
        field(7601;"Copy Sell-to Addr. to Qte From";Option)
        {
            AccessByPermission = TableData Contact=R;
            CaptionML = ENU='Copy Sell-to Addr. to Qte From',
                        FRB='Copier adr donn ordre => devis',
                        NLB='Adres kopiëren naar offerte van';
            OptionCaptionML = ENU='Company,Person',
                              FRB='Société,Personne',
                              NLB='Bedrijf,Persoon';
            OptionMembers = Company,Person;
        }
        field(7602;"Validate EU Vat Reg. No.";Boolean)
        {
            CaptionML = ENU='Validate EU Vat Reg. No.',
                        FRB='Valider N° id. intracomm. Union européenne',
                        NLB='EU btw-nummer valideren.';
        }
        field(8000;Id;Guid)
        {
            CaptionML = ENU='Id',
                        FRB='Id',
                        NLB='Id';
        }
        field(8001;"Currency Id";Guid)
        {
            CaptionML = ENU='Currency Id',
                        FRB='ID Devise',
                        NLB='Valuta-id';
            TableRelation = Currency.Id;

            trigger OnValidate();
            begin
                UpdateCurrencyCode;
            end;
        }
        field(8002;"Payment Terms Id";Guid)
        {
            CaptionML = ENU='Payment Terms Id',
                        FRB='ID Conditions de paiement',
                        NLB='Betalingsvoorwaarden-id';
            TableRelation = "Payment Terms".Id;

            trigger OnValidate();
            begin
                UpdatePaymentTermsCode;
            end;
        }
        field(8003;"Shipment Method Id";Guid)
        {
            CaptionML = ENU='Shipment Method Id',
                        FRB='ID Conditions de livraison',
                        NLB='Verzendwijze-id';
            TableRelation = "Shipment Method".Id;

            trigger OnValidate();
            begin
                UpdateShipmentMethodCode;
            end;
        }
        field(8004;"Payment Method Id";Guid)
        {
            CaptionML = ENU='Payment Method Id',
                        FRB='ID mode de règlement',
                        NLB='Betalingswijze-id';
            TableRelation = "Payment Method".Id;

            trigger OnValidate();
            begin
                UpdatePaymentMethodCode;
            end;
        }
        field(9003;"Tax Area ID";Guid)
        {
            CaptionML = ENU='Tax Area ID',
                        FRB='ID zone de recouvrement',
                        NLB='Belastinggebied-id';

            trigger OnValidate();
            begin
                UpdateTaxAreaCode;
            end;
        }
        field(9004;"Tax Area Display Name";Text[50])
        {
            CalcFormula = Lookup("Tax Area".Description WHERE (Code=FIELD("Tax Area Code")));
            CaptionML = ENU='Tax Area Display Name',
                        FRB='Nom d''affichage de zone de recouvrement',
                        NLB='Weergavenaam belastinggebied';
            FieldClass = FlowField;
            ObsoleteReason = 'This field is not needed and it should not be used.';
            ObsoleteState = Pending;
        }
        field(9005;"Contact ID";Guid)
        {
            CaptionML = ENU='Contact ID',
                        FRB='ID contact',
                        NLB='Contact-id';
        }
        field(9006;"Contact Graph Id";Text[250])
        {
            CaptionML = ENU='Contact Graph Id',
                        FRB='ID Graph Contact',
                        NLB='Graph-id van contactpersoon';
        }
        field(11310;"Enterprise No.";Text[50])
        {
            CaptionML = ENU='Enterprise No.',
                        FRB='N° de société',
                        NLB='Ondernemingsnr.';

            trigger OnValidate();
            begin
                if "Enterprise No." <> DELCHR("Enterprise No.",'=','0123456789') then begin
                  if not Country.DetermineCountry("Country/Region Code") then
                    ERROR(Text11302,FIELDCAPTION("Enterprise No.") + ' ' + "No.");
                  if not EnterpriseNoMgt.MOD97Check("Enterprise No.") then
                    ERROR(Text11300,FIELDCAPTION("Enterprise No."));
                  "VAT Registration No." := '';
                end;
            end;
        }
        field(2000020;"Domiciliation No.";Text[12])
        {
            CaptionML = ENU='Domiciliation No.',
                        FRB='N° de domiciliation',
                        NLB='Domiciliëringsnr.';
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
        key(Key2;"Search Name")
        {
        }
        key(Key3;"Customer Posting Group")
        {
        }
        key(Key4;"Currency Code")
        {
        }
        key(Key5;"Country/Region Code")
        {
        }
        key(Key6;"Gen. Bus. Posting Group")
        {
        }
        key(Key7;Name,Address,City)
        {
        }
        key(Key8;"VAT Registration No.")
        {
        }
        key(Key9;Name)
        {
        }
        key(Key10;City)
        {
        }
        key(Key11;"Post Code")
        {
        }
        key(Key12;"Phone No.")
        {
        }
        key(Key13;Contact)
        {
        }
        key(Key14;"Enterprise No.")
        {
        }
        key(Key15;"Domiciliation No.")
        {
            Enabled = false;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"No.",Name,City,"Post Code","Phone No.",Contact)
        {
        }
        fieldgroup(Brick;"No.",Name,"Balance (LCY)",Contact,"Balance Due (LCY)",Image)
        {
        }
    }

    trigger OnDelete();
    var
        CampaignTargetGr : Record "Campaign Target Group";
        ContactBusRel : Record "Contact Business Relation";
        Job : Record Job;
        SocialListeningSearchTopic : Record "Social Listening Search Topic";
        StdCustSalesCode : Record "Standard Customer Sales Code";
        CustomReportSelection : Record "Custom Report Selection";
        MyCustomer : Record "My Customer";
        ServHeader : Record "Service Header";
        CampaignTargetGrMgmt : Codeunit "Campaign Target Group Mgt";
        VATRegistrationLogMgt : Codeunit "VAT Registration Log Mgt.";
    begin
        ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);

        ServiceItem.SETRANGE("Customer No.","No.");
        if ServiceItem.FINDFIRST then
          if CONFIRM(
               Text008,
               false,
               TABLECAPTION,
               "No.",
               ServiceItem.FIELDCAPTION("Customer No."))
          then
            ServiceItem.MODIFYALL("Customer No.",'')
          else
            ERROR(Text009);

        Job.SETRANGE("Bill-to Customer No.","No.");
        if not Job.ISEMPTY then
          ERROR(Text015,TABLECAPTION,"No.",Job.TABLECAPTION);

        MoveEntries.MoveCustEntries(Rec);

        CommentLine.SETRANGE("Table Name",CommentLine."Table Name"::Customer);
        CommentLine.SETRANGE("No.","No.");
        CommentLine.DELETEALL;

        CustBankAcc.SETRANGE("Customer No.","No.");
        CustBankAcc.DELETEALL;

        ShipToAddr.SETRANGE("Customer No.","No.");
        ShipToAddr.DELETEALL;

        SalesPrice.SETRANGE("Sales Type",SalesPrice."Sales Type"::Customer);
        SalesPrice.SETRANGE("Sales Code","No.");
        SalesPrice.DELETEALL;

        SalesLineDisc.SETRANGE("Sales Type",SalesLineDisc."Sales Type"::Customer);
        SalesLineDisc.SETRANGE("Sales Code","No.");
        SalesLineDisc.DELETEALL;

        SalesPrepmtPct.SETCURRENTKEY("Sales Type","Sales Code");
        SalesPrepmtPct.SETRANGE("Sales Type",SalesPrepmtPct."Sales Type"::Customer);
        SalesPrepmtPct.SETRANGE("Sales Code","No.");
        SalesPrepmtPct.DELETEALL;

        StdCustSalesCode.SETRANGE("Customer No.","No.");
        StdCustSalesCode.DELETEALL(true);

        ItemCrossReference.SETCURRENTKEY("Cross-Reference Type","Cross-Reference Type No.");
        ItemCrossReference.SETRANGE("Cross-Reference Type",ItemCrossReference."Cross-Reference Type"::Customer);
        ItemCrossReference.SETRANGE("Cross-Reference Type No.","No.");
        ItemCrossReference.DELETEALL;

        if not SocialListeningSearchTopic.ISEMPTY then begin
          SocialListeningSearchTopic.FindSearchTopic(SocialListeningSearchTopic."Source Type"::Customer,"No.");
          SocialListeningSearchTopic.DELETEALL;
        end;

        SalesOrderLine.SETCURRENTKEY("Document Type","Bill-to Customer No.");
        SalesOrderLine.SETFILTER(
          "Document Type",'%1|%2',
          SalesOrderLine."Document Type"::Order,
          SalesOrderLine."Document Type"::"Return Order");
        SalesOrderLine.SETRANGE("Bill-to Customer No.","No.");
        if SalesOrderLine.FINDFIRST then
          ERROR(
            Text000,
            TABLECAPTION,"No.",SalesOrderLine."Document Type");

        SalesOrderLine.SETRANGE("Bill-to Customer No.");
        SalesOrderLine.SETRANGE("Sell-to Customer No.","No.");
        if SalesOrderLine.FINDFIRST then
          ERROR(
            Text000,
            TABLECAPTION,"No.",SalesOrderLine."Document Type");

        CampaignTargetGr.SETRANGE("No.","No.");
        CampaignTargetGr.SETRANGE(Type,CampaignTargetGr.Type::Customer);
        if CampaignTargetGr.FIND('-') then begin
          ContactBusRel.SETRANGE("Link to Table",ContactBusRel."Link to Table"::Customer);
          ContactBusRel.SETRANGE("No.","No.");
          ContactBusRel.FINDFIRST;
          repeat
            CampaignTargetGrMgmt.ConverttoContact(Rec,ContactBusRel."Contact No.");
          until CampaignTargetGr.NEXT = 0;
        end;

        ServContract.SETFILTER(Status,'<>%1',ServContract.Status::Canceled);
        ServContract.SETRANGE("Customer No.","No.");
        if not ServContract.ISEMPTY then
          ERROR(
            Text007,
            TABLECAPTION,"No.");

        ServContract.SETRANGE(Status);
        ServContract.MODIFYALL("Customer No.",'');

        ServContract.SETFILTER(Status,'<>%1',ServContract.Status::Canceled);
        ServContract.SETRANGE("Bill-to Customer No.","No.");
        if not ServContract.ISEMPTY then
          ERROR(
            Text007,
            TABLECAPTION,"No.");

        ServContract.SETRANGE(Status);
        ServContract.MODIFYALL("Bill-to Customer No.",'');

        ServHeader.SETCURRENTKEY("Customer No.","Order Date");
        ServHeader.SETRANGE("Customer No.","No.");
        if ServHeader.FINDFIRST then
          ERROR(
            Text013,
            TABLECAPTION,"No.",ServHeader."Document Type");

        ServHeader.SETRANGE("Bill-to Customer No.");
        if ServHeader.FINDFIRST then
          ERROR(
            Text013,
            TABLECAPTION,"No.",ServHeader."Document Type");

        UpdateContFromCust.OnDelete(Rec);

        CustomReportSelection.SETRANGE("Source Type",DATABASE::Customer);
        CustomReportSelection.SETRANGE("Source No.","No.");
        CustomReportSelection.DELETEALL;

        MyCustomer.SETRANGE("Customer No.","No.");
        MyCustomer.DELETEALL;
        VATRegistrationLogMgt.DeleteCustomerLog(Rec);

        DimMgt.DeleteDefaultDim(DATABASE::Customer,"No.");
    end;

    trigger OnInsert();
    begin
        if "No." = '' then begin
          SalesSetup.GET;
          SalesSetup.TESTFIELD("Customer Nos.");
          NoSeriesMgt.InitSeries(SalesSetup."Customer Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;

        if "Invoice Disc. Code" = '' then
          "Invoice Disc. Code" := "No.";

        if not (InsertFromContact or (InsertFromTemplate and (Contact <> '')) or ISTEMPORARY) then
          UpdateContFromCust.OnInsert(Rec);

        if "Salesperson Code" = '' then
          SetDefaultSalesperson;

        DimMgt.UpdateDefaultDim(
          DATABASE::Customer,"No.",
          "Global Dimension 1 Code","Global Dimension 2 Code");

        SetLastModifiedDateTime;
    end;

    trigger OnModify();
    begin
        SetLastModifiedDateTime;
        if IsContactUpdateNeeded then begin
          MODIFY;
          UpdateContFromCust.OnModify(Rec);
          if not FIND then begin
            RESET;
            if FIND then;
          end;
        end;
    end;

    trigger OnRename();
    var
        CustomerTemplate : Record "Customer Template";
        SkipRename : Boolean;
    begin
        // Give extensions option to opt out of rename logic.
        SkipRenamingLogic(SkipRename);
        if SkipRename then
          exit;

        ApprovalsMgmt.OnRenameRecordInApprovalRequest(xRec.RECORDID,RECORDID);

        SetLastModifiedDateTime;
        if xRec."Invoice Disc. Code" = xRec."No." then
          "Invoice Disc. Code" := "No.";
        CustomerTemplate.SETRANGE("Invoice Disc. Code",xRec."No.");
        CustomerTemplate.MODIFYALL("Invoice Disc. Code","No.");
    end;

    var
        Text000 : TextConst ENU='You cannot delete %1 %2 because there is at least one outstanding Sales %3 for this customer.',FRB='Vous ne pouvez pas supprimer %1 %2 car il existe encore au moins une %3 vente ouverte pour ce client.',NLB='U kunt %1 %2 niet verwijderen omdat er minstens één openstaande %3 voor deze klant is.';
        Text002 : TextConst ENU='Do you wish to create a contact for %1 %2?',FRB='Souhaitez-vous créer un contact pour %1 %2 ?',NLB='Wilt u een contact voor %1 %2 maken?';
        SalesSetup : Record "Sales & Receivables Setup";
        CommentLine : Record "Comment Line";
        SalesOrderLine : Record "Sales Line";
        CustBankAcc : Record "Customer Bank Account";
        ShipToAddr : Record "Ship-to Address";
        PostCode : Record "Post Code";
        GenBusPostingGrp : Record "Gen. Business Posting Group";
        ShippingAgentService : Record "Shipping Agent Services";
        ItemCrossReference : Record "Item Cross Reference";
        RMSetup : Record "Marketing Setup";
        SalesPrice : Record "Sales Price";
        SalesLineDisc : Record "Sales Line Discount";
        SalesPrepmtPct : Record "Sales Prepayment %";
        ServContract : Record "Service Contract Header";
        ServiceItem : Record "Service Item";
        Country : Record "Country/Region";
        EnterpriseNoMgt : Codeunit VATLogicalTests;
        PaymentToleranceMgt : Codeunit "Payment Tolerance Management";
        NoSeriesMgt : Codeunit NoSeriesManagement;
        MoveEntries : Codeunit MoveEntries;
        UpdateContFromCust : Codeunit "CustCont-Update";
        DimMgt : Codeunit DimensionManagement;
        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
        InsertFromContact : Boolean;
        Text003 : TextConst ENU='Contact %1 %2 is not related to customer %3 %4.',FRB='Le contact %1 %2 n''est pas associé au client %3 %4.',NLB='Contact %1 %2 is niet gekoppeld aan klant %3 %4.';
        Text004 : TextConst ENU='post',FRB='valider',NLB='boeken';
        Text005 : TextConst ENU='create',FRB='créer',NLB='maken';
        Text006 : TextConst ENU='You cannot %1 this type of document when Customer %2 is blocked with type %3',FRB='Vous ne pouvez pas %1 ce type de document lorsque le client %2 est bloqué avec le type %3',NLB='U kunt dit soort documenten niet %1 als het veld Geblokkeerd voor klant %2 de optie %3 bevat.';
        Text007 : TextConst ENU='You cannot delete %1 %2 because there is at least one not cancelled Service Contract for this customer.',FRB='Vous ne pouvez pas supprimer l''enregistrement %1 %2 car il existe au moins un contrat service qui n''a pas été annulé pour ce client.',NLB='U kunt %1 %2 niet verwijderen, omdat er minstens één niet-geannuleerd servicecontract voor deze klant is.';
        Text008 : TextConst ENU='Deleting the %1 %2 will cause the %3 to be deleted for the associated Service Items. Do you want to continue?',FRB='Supprimer l''enregistrement %1 %2 va entraîner la suppression de la valeur %3 pour les articles de service associés. Souhaitez-vous continuer ?',NLB='Als u %1 %2 verwijdert, wordt het %3 op de gekoppelde serviceartikelen ook verwijderd. Wilt u doorgaan?';
        Text009 : TextConst ENU='Cannot delete customer.',FRB='Impossible de supprimer ce client.',NLB='Klant kan niet verwijderd worden.';
        Text010 : TextConst ENU='The %1 %2 has been assigned to %3 %4.\The same %1 cannot be entered on more than one %3. Enter another code.',FRB='La valeur %1 %2 a été affectée à %3 %4.\La même valeur %1 ne peut pas être entrée sur plus d''un/une %3. Entrez un autre code.',NLB='%1 %2 is toegewezen aan %3 %4.\Dezelfde %1 kan slechts bij één %3 worden ingevoerd. Voer een andere code in.';
        Text011 : TextConst ENU='Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?',FRB='Le rapprochement des transactions IC risque de poser problème si vous modifiez le code partenaire IC car ce/cette %1 comporte des écritures comptables appartenant à un exercice comptable qui n''a pas encore été clôturé.\ Souhaitez-vous quand même modifier le code partenaire IC ?',NLB='Reconciliatie van IC-transacties kan moeilijk zijn als u de IC-partnercode wijzigt, omdat dit %1 een aantal posten bevat in een boekjaar dat nog niet is afgesloten.\ Wilt u de IC-partnercode toch wijzigen?';
        Text012 : TextConst ENU='You cannot change the contents of the %1 field because this %2 has one or more open ledger entries.',FRB='Vous ne pouvez pas modifier la valeur du champ %1 car ce/cette %2 comporte une ou plusieurs écritures comptables ouvertes.',NLB='U kunt de inhoud van het veld %1 niet wijzigen, omdat er een aantal openstaande posten zijn in %2.';
        Text013 : TextConst ENU='You cannot delete %1 %2 because there is at least one outstanding Service %3 for this customer.',FRB='Vous ne pouvez pas supprimer %1 %2 car il existe encore au moins un(e) %3 service ouvert(e) pour ce client.',NLB='U kunt %1 %2 niet verwijderen omdat voor deze klant ten minste één openstaande service (%3) bestaat.';
        Text014 : TextConst ENU='Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.',FRB='Avant de pouvoir utiliser Online Map, vous devez compléter la fenêtre Configuration Online Map.\Consultez la section Configuration d''Online Map dans l''Aide.',NLB='Voordat u Online Map kunt gebruiken, moet u het venster Online Map installeren invullen.\Zie Online Map instellen in de Help.';
        Text015 : TextConst ENU='You cannot delete %1 %2 because there is at least one %3 associated to this customer.',FRB='Vous ne pouvez pas supprimer %1 %2 car au moins un/une %3 est associé(e) à ce client.',NLB='U kunt %1 %2 niet verwijderen omdat er ten minste één %3 aan deze klant is gekoppeld.';
        AllowPaymentToleranceQst : TextConst ENU='Do you want to allow payment tolerance for entries that are currently open?',FRB='Souhaitez-vous autoriser les écarts de règlement pour les écritures actuellement ouvertes ?',NLB='Wilt u betalingstolerantie toestaan voor posten die momenteel openstaan?';
        RemovePaymentRoleranceQst : TextConst ENU='Do you want to remove payment tolerance from entries that are currently open?',FRB='Souhaitez-vous supprimer les écarts de règlement pour les écritures actuellement ouvertes ?',NLB='Wilt u betalingstolerantie verwijderen voor posten die momenteel openstaan?';
        Text11300 : TextConst ENU='%1 is not valid.',FRB='%1 n''est pas valide.',NLB='%1 is niet geldig.';
        Text11301 : TextConst ENU='You must use %1 for Belgian customers.',FRB='Vous devez utiliser %1 pour les clients belges.',NLB='U moet %1 gebruiken voor Belgische klanten.';
        Text11302 : TextConst ENU='You cannot use %1 for foreign customers.',FRB='Vous ne pouvez pas utiliser %1 pour les clients étrangers.',NLB='U kunt %1 niet gebruiken voor buitenlandse klanten.';
        CreateNewCustTxt : TextConst Comment='%1 is the name to be used to create the customer. ',ENU='Create a new customer card for %1',FRB='Créer une fiche client pour %1',NLB='Een nieuwe klantenkaart maken voor %1';
        SelectCustErr : TextConst ENU='You must select an existing customer.',FRB='Vous devez sélectionner un client existant.',NLB='U moet een bestaande klant selecteren.';
        CustNotRegisteredTxt : TextConst ENU='This customer is not registered. To continue, choose one of the following options:',FRB='Ce client n''est pas enregistré. Pour continuer, sélectionnez l''une des options suivantes :',NLB='Deze klant is niet geregistreerd. Als u door wilt gaan, kiest u een van de volgende opties:';
        SelectCustTxt : TextConst ENU='Select an existing customer',FRB='Sélectionner un client existant',NLB='Een bestaande klant selecteren';
        InsertFromTemplate : Boolean;
        LookupRequested : Boolean;
        OverrideImageQst : TextConst ENU='Override Image?',FRB='Remplacer l''image ?',NLB='Afbeelding overschrijven?';
        CannotDeleteBecauseInInvErr : TextConst Comment='%1 = the object to be deleted (example: Item, Customer).',ENU='You cannot delete %1 because it has open invoices.',FRB='Vous ne pouvez pas supprimer %1 car il y a des factures ouvertes.',NLB='U kunt %1 niet verwijderen, omdat er openstaande facturen aan zijn gekoppeld.';

    [Scope('Personalization')]
    procedure AssistEdit(OldCust : Record Customer) : Boolean;
    var
        Cust : Record Customer;
    begin
        with Cust do begin
          Cust := Rec;
          SalesSetup.GET;
          SalesSetup.TESTFIELD("Customer Nos.");
          if NoSeriesMgt.SelectSeries(SalesSetup."Customer Nos.",OldCust."No. Series","No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            Rec := Cust;
            exit(true);
          end;
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber : Integer;var ShortcutDimCode : Code[20]);
    begin
        DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::Customer,"No.",FieldNumber,ShortcutDimCode);
        MODIFY;
    end;

    [Scope('Personalization')]
    procedure ShowContact();
    var
        ContBusRel : Record "Contact Business Relation";
        Cont : Record Contact;
        OfficeContact : Record Contact;
        OfficeMgt : Codeunit "Office Management";
    begin
        if OfficeMgt.GetContact(OfficeContact,"No.") and (OfficeContact.COUNT = 1) then
          PAGE.RUN(PAGE::"Contact Card",OfficeContact)
        else begin
          if "No." = '' then
            exit;

          ContBusRel.SETCURRENTKEY("Link to Table","No.");
          ContBusRel.SETRANGE("Link to Table",ContBusRel."Link to Table"::Customer);
          ContBusRel.SETRANGE("No.","No.");
          if not ContBusRel.FINDFIRST then begin
            if not CONFIRM(Text002,false,TABLECAPTION,"No.") then
              exit;
            UpdateContFromCust.InsertNewContact(Rec,false);
            ContBusRel.FINDFIRST;
          end;
          COMMIT;

          Cont.FILTERGROUP(2);
          Cont.SETRANGE("Company No.",ContBusRel."Contact No.");
          if Cont.ISEMPTY then begin
            Cont.SETRANGE("Company No.");
            Cont.SETRANGE("No.",ContBusRel."Contact No.");
          end;
          PAGE.RUN(PAGE::"Contact List",Cont);
        end;
    end;

    [Scope('Personalization')]
    procedure SetInsertFromContact(FromContact : Boolean);
    begin
        InsertFromContact := FromContact;
    end;

    [Scope('Personalization')]
    procedure CheckBlockedCustOnDocs(Cust2 : Record Customer;DocType : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";Shipment : Boolean;Transaction : Boolean);
    begin
        with Cust2 do begin
          if ((Blocked = Blocked::All) or
              ((Blocked = Blocked::Invoice) and
               (DocType in [DocType::Quote,DocType::Order,DocType::Invoice,DocType::"Blanket Order"])) or
              ((Blocked = Blocked::Ship) and (DocType in [DocType::Quote,DocType::Order,DocType::"Blanket Order"]) and
               (not Transaction)) or
              ((Blocked = Blocked::Ship) and (DocType in [DocType::Quote,DocType::Order,DocType::Invoice,DocType::"Blanket Order"]) and
               Shipment and Transaction))
          then
            CustBlockedErrorMessage(Cust2,Transaction);
        end;
    end;

    [Scope('Personalization')]
    procedure CheckBlockedCustOnJnls(Cust2 : Record Customer;DocType : Option " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;Transaction : Boolean);
    begin
        with Cust2 do begin
          if (Blocked = Blocked::All) or
             ((Blocked = Blocked::Invoice) and (DocType in [DocType::Invoice,DocType::" "]))
          then
            CustBlockedErrorMessage(Cust2,Transaction)
        end;
    end;

    [Scope('Personalization')]
    procedure CustBlockedErrorMessage(Cust2 : Record Customer;Transaction : Boolean);
    var
        "Action" : Text[30];
    begin
        if Transaction then
          Action := Text004
        else
          Action := Text005;
        ERROR(Text006,Action,Cust2."No.",Cust2.Blocked);
    end;

    [Scope('Internal')]
    procedure DisplayMap();
    var
        MapPoint : Record "Online Map Setup";
        MapMgt : Codeunit "Online Map Management";
    begin
        if MapPoint.FINDFIRST then
          MapMgt.MakeSelection(DATABASE::Customer,GETPOSITION)
        else
          MESSAGE(Text014);
    end;

    [Scope('Personalization')]
    procedure GetTotalAmountLCY() : Decimal;
    begin
        CALCFIELDS("Balance (LCY)","Outstanding Orders (LCY)","Shipped Not Invoiced (LCY)","Outstanding Invoices (LCY)",
          "Outstanding Serv. Orders (LCY)","Serv Shipped Not Invoiced(LCY)","Outstanding Serv.Invoices(LCY)");

        exit(GetTotalAmountLCYCommon);
    end;

    [Scope('Personalization')]
    procedure GetTotalAmountLCYUI() : Decimal;
    begin
        SETAUTOCALCFIELDS("Balance (LCY)","Outstanding Orders (LCY)","Shipped Not Invoiced (LCY)","Outstanding Invoices (LCY)",
          "Outstanding Serv. Orders (LCY)","Serv Shipped Not Invoiced(LCY)","Outstanding Serv.Invoices(LCY)");

        exit(GetTotalAmountLCYCommon);
    end;

    local procedure GetTotalAmountLCYCommon() : Decimal;
    var
        SalesLine : Record "Sales Line";
        ServiceLine : Record "Service Line";
        SalesOutstandingAmountFromShipment : Decimal;
        ServOutstandingAmountFromShipment : Decimal;
        InvoicedPrepmtAmountLCY : Decimal;
    begin
        SalesOutstandingAmountFromShipment := SalesLine.OutstandingInvoiceAmountFromShipment("No.");
        ServOutstandingAmountFromShipment := ServiceLine.OutstandingInvoiceAmountFromShipment("No.");
        InvoicedPrepmtAmountLCY := GetInvoicedPrepmtAmountLCY;

        exit("Balance (LCY)" + "Outstanding Orders (LCY)" + "Shipped Not Invoiced (LCY)" + "Outstanding Invoices (LCY)" +
          "Outstanding Serv. Orders (LCY)" + "Serv Shipped Not Invoiced(LCY)" + "Outstanding Serv.Invoices(LCY)" -
          SalesOutstandingAmountFromShipment - ServOutstandingAmountFromShipment - InvoicedPrepmtAmountLCY);
    end;

    [Scope('Personalization')]
    procedure GetSalesLCY() : Decimal;
    var
        CustomerSalesYTD : Record Customer;
        AccountingPeriod : Record "Accounting Period";
        StartDate : Date;
        EndDate : Date;
    begin
        StartDate := AccountingPeriod.GetFiscalYearStartDate(WORKDATE);
        EndDate := AccountingPeriod.GetFiscalYearEndDate(WORKDATE);
        CustomerSalesYTD := Rec;
        CustomerSalesYTD."SECURITYFILTERING"("SECURITYFILTERING");
        CustomerSalesYTD.SETRANGE("Date Filter",StartDate,EndDate);
        CustomerSalesYTD.CALCFIELDS("Sales (LCY)");
        exit(CustomerSalesYTD."Sales (LCY)");
    end;

    [Scope('Personalization')]
    procedure CalcAvailableCredit() : Decimal;
    begin
        exit(CalcAvailableCreditCommon(false));
    end;

    [Scope('Personalization')]
    procedure CalcAvailableCreditUI() : Decimal;
    begin
        exit(CalcAvailableCreditCommon(true));
    end;

    local procedure CalcAvailableCreditCommon(CalledFromUI : Boolean) : Decimal;
    begin
        if "Credit Limit (LCY)" = 0 then
          exit(0);
        if CalledFromUI then
          exit("Credit Limit (LCY)" - GetTotalAmountLCYUI);
        exit("Credit Limit (LCY)" - GetTotalAmountLCY);
    end;

    [Scope('Personalization')]
    procedure CalcOverdueBalance() OverDueBalance : Decimal;
    var
        [SecurityFiltering(SecurityFilter::Filtered)]CustLedgEntryRemainAmtQuery : Query "Cust. Ledg. Entry Remain. Amt.";
    begin
        CustLedgEntryRemainAmtQuery.SETRANGE(Customer_No,"No.");
        CustLedgEntryRemainAmtQuery.SETRANGE(IsOpen,true);
        CustLedgEntryRemainAmtQuery.SETFILTER(Due_Date,'<%1',WORKDATE);
        CustLedgEntryRemainAmtQuery.OPEN;

        if CustLedgEntryRemainAmtQuery.READ then
          OverDueBalance := CustLedgEntryRemainAmtQuery.Sum_Remaining_Amt_LCY;
    end;

    [Scope('Personalization')]
    procedure GetLegalEntityType() : Text;
    begin
        exit(FORMAT("Partner Type"));
    end;

    [Scope('Personalization')]
    procedure GetLegalEntityTypeLbl() : Text;
    begin
        exit(FIELDCAPTION("Partner Type"));
    end;

    [Scope('Personalization')]
    procedure SetStyle() : Text;
    begin
        if CalcAvailableCredit < 0 then
          exit('Unfavorable');
        exit('');
    end;

    [Scope('Personalization')]
    procedure HasValidDDMandate(Date : Date) : Boolean;
    var
        SEPADirectDebitMandate : Record "SEPA Direct Debit Mandate";
    begin
        exit(SEPADirectDebitMandate.GetDefaultMandate("No.",Date) <> '');
    end;

    [Scope('Personalization')]
    procedure GetInvoicedPrepmtAmountLCY() : Decimal;
    var
        SalesLine : Record "Sales Line";
    begin
        SalesLine.SETCURRENTKEY("Document Type","Bill-to Customer No.");
        SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Order);
        SalesLine.SETRANGE("Bill-to Customer No.","No.");
        SalesLine.CALCSUMS("Prepmt. Amount Inv. (LCY)","Prepmt. VAT Amount Inv. (LCY)");
        exit(SalesLine."Prepmt. Amount Inv. (LCY)" + SalesLine."Prepmt. VAT Amount Inv. (LCY)");
    end;

    [Scope('Personalization')]
    procedure CalcCreditLimitLCYExpendedPct() : Decimal;
    begin
        if "Credit Limit (LCY)" = 0 then
          exit(0);

        if "Balance (LCY)" / "Credit Limit (LCY)" < 0 then
          exit(0);

        if "Balance (LCY)" / "Credit Limit (LCY)" > 1 then
          exit(10000);

        exit(ROUND("Balance (LCY)" / "Credit Limit (LCY)" * 10000,1));
    end;

    [Scope('Personalization')]
    procedure CreateAndShowNewInvoice();
    var
        SalesHeader : Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader.SETRANGE("Sell-to Customer No.","No.");
        SalesHeader.INSERT(true);
        COMMIT;
        PAGE.RUN(PAGE::"Sales Invoice",SalesHeader)
    end;

    [Scope('Personalization')]
    procedure CreateAndShowNewOrder();
    var
        SalesHeader : Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader.SETRANGE("Sell-to Customer No.","No.");
        SalesHeader.INSERT(true);
        COMMIT;
        PAGE.RUN(PAGE::"Sales Order",SalesHeader)
    end;

    [Scope('Personalization')]
    procedure CreateAndShowNewCreditMemo();
    var
        SalesHeader : Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";
        SalesHeader.SETRANGE("Sell-to Customer No.","No.");
        SalesHeader.INSERT(true);
        COMMIT;
        PAGE.RUN(PAGE::"Sales Credit Memo",SalesHeader)
    end;

    [Scope('Personalization')]
    procedure CreateAndShowNewQuote();
    var
        SalesHeader : Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;
        SalesHeader.SETRANGE("Sell-to Customer No.","No.");
        SalesHeader.INSERT(true);
        COMMIT;
        PAGE.RUN(PAGE::"Sales Quote",SalesHeader)
    end;

    local procedure UpdatePaymentTolerance(UseDialog : Boolean);
    begin
        if "Block Payment Tolerance" then begin
          if UseDialog then
            if not CONFIRM(RemovePaymentRoleranceQst,false) then
              exit;
          PaymentToleranceMgt.DelTolCustLedgEntry(Rec);
        end else begin
          if UseDialog then
            if not CONFIRM(AllowPaymentToleranceQst,false) then
              exit;
          PaymentToleranceMgt.CalcTolCustLedgEntry(Rec);
        end;
    end;

    [Scope('Personalization')]
    procedure GetBillToCustomerNo() : Code[20];
    begin
        if "Bill-to Customer No." <> '' then
          exit("Bill-to Customer No.");
        exit("No.");
    end;

    [Scope('Personalization')]
    procedure HasAddressIgnoreCountryCode() : Boolean;
    begin
        case true of
          Address <> '':
            exit(true);
          "Address 2" <> '':
            exit(true);
          City <> '':
            exit(true);
          County <> '':
            exit(true);
          "Post Code" <> '':
            exit(true);
          Contact <> '':
            exit(true);
        end;

        exit(false);
    end;

    [Scope('Personalization')]
    procedure HasAddress() : Boolean;
    begin
        exit(HasAddressIgnoreCountryCode or ("Country/Region Code" <> ''));
    end;

    [Scope('Personalization')]
    procedure GetCustNo(CustomerText : Text) : Text;
    begin
        exit(GetCustNoOpenCard(CustomerText,true,true));
    end;

    [Scope('Personalization')]
    procedure GetCustNoOpenCard(CustomerText : Text;ShowCustomerCard : Boolean;ShowCreateCustomerOption : Boolean) : Code[20];
    var
        Customer : Record Customer;
        CustomerNo : Code[20];
        NoFiltersApplied : Boolean;
        CustomerWithoutQuote : Text;
        CustomerFilterFromStart : Text;
        CustomerFilterContains : Text;
    begin
        if CustomerText = '' then
          exit('');

        if STRLEN(CustomerText) <= MAXSTRLEN(Customer."No.") then
          if Customer.GET(COPYSTR(CustomerText,1,MAXSTRLEN(Customer."No."))) then
            exit(Customer."No.");

        Customer.SETRANGE(Blocked,Customer.Blocked::" ");
        Customer.SETRANGE(Name,CustomerText);
        if Customer.FINDFIRST then
          exit(Customer."No.");

        CustomerWithoutQuote := CONVERTSTR(CustomerText,'''','?');
        Customer.SETFILTER(Name,'''@' + CustomerWithoutQuote + '''');
        if Customer.FINDFIRST then
          exit(Customer."No.");
        Customer.SETRANGE(Name);

        CustomerFilterFromStart := '''@' + CustomerWithoutQuote + '*''';

        Customer.FILTERGROUP := -1;
        Customer.SETFILTER("No.",CustomerFilterFromStart);

        Customer.SETFILTER(Name,CustomerFilterFromStart);

        if Customer.FINDFIRST then
          exit(Customer."No.");

        CustomerFilterContains := '''@*' + CustomerWithoutQuote + '*''';

        Customer.SETFILTER("No.",CustomerFilterContains);
        Customer.SETFILTER(Name,CustomerFilterContains);
        Customer.SETFILTER(City,CustomerFilterContains);
        Customer.SETFILTER(Contact,CustomerFilterContains);
        Customer.SETFILTER("Phone No.",CustomerFilterContains);
        Customer.SETFILTER("Post Code",CustomerFilterContains);

        if Customer.COUNT = 0 then
          MarkCustomersWithSimilarName(Customer,CustomerText);

        if Customer.COUNT = 1 then begin
          Customer.FINDFIRST;
          exit(Customer."No.");
        end;

        if not GUIALLOWED then
          ERROR(SelectCustErr);

        if Customer.COUNT = 0 then begin
          if Customer.WRITEPERMISSION then
            if ShowCreateCustomerOption then
              case STRMENU(
                     STRSUBSTNO(
                       '%1,%2',STRSUBSTNO(CreateNewCustTxt,CONVERTSTR(CustomerText,',','.')),SelectCustTxt),1,CustNotRegisteredTxt) of
                0:
                  ERROR(SelectCustErr);
                1:
                  exit(CreateNewCustomer(COPYSTR(CustomerText,1,MAXSTRLEN(Customer.Name)),ShowCustomerCard));
              end
            else
              exit('');
          Customer.RESET;
          NoFiltersApplied := true;
        end;

        if ShowCustomerCard then
          CustomerNo := PickCustomer(Customer,NoFiltersApplied)
        else begin
          LookupRequested := true;
          exit('');
        end;

        if CustomerNo <> '' then
          exit(CustomerNo);

        ERROR(SelectCustErr);
    end;

    local procedure MarkCustomersWithSimilarName(var Customer : Record Customer;CustomerText : Text);
    var
        TypeHelper : Codeunit "Type Helper";
        CustomerCount : Integer;
        CustomerTextLength : Integer;
        Treshold : Integer;
    begin
        if CustomerText = '' then
          exit;
        if STRLEN(CustomerText) > MAXSTRLEN(Customer.Name) then
          exit;
        CustomerTextLength := STRLEN(CustomerText);
        Treshold := CustomerTextLength div 5;
        if Treshold = 0 then
          exit;

        Customer.RESET;
        Customer.ASCENDING(false); // most likely to search for newest customers
        Customer.SETRANGE(Blocked,Customer.Blocked::" ");
        if Customer.FINDSET then
          repeat
            CustomerCount += 1;
            if ABS(CustomerTextLength - STRLEN(Customer.Name)) <= Treshold then
              if TypeHelper.TextDistance(UPPERCASE(CustomerText),UPPERCASE(Customer.Name)) <= Treshold then
                Customer.MARK(true);
          until Customer.MARK or (Customer.NEXT = 0) or (CustomerCount > 1000);
        Customer.MARKEDONLY(true);
    end;

    [Scope('Internal')]
    procedure CreateNewCustomer(CustomerName : Text[50];ShowCustomerCard : Boolean) : Code[20];
    var
        Customer : Record Customer;
        MiniCustomerTemplate : Record "Mini Customer Template";
        CustomerCard : Page "Customer Card";
    begin
        Customer.Name := CustomerName;
        if not MiniCustomerTemplate.NewCustomerFromTemplate(Customer) then
          Customer.INSERT(true)
        else
          if CustomerName <> Customer.Name then begin
            Customer.Name := CustomerName;
            Customer.MODIFY(true);
          end;

        COMMIT;
        if not ShowCustomerCard then
          exit(Customer."No.");
        Customer.SETRANGE("No.",Customer."No.");
        CustomerCard.SETTABLEVIEW(Customer);
        if not (CustomerCard.RUNMODAL = ACTION::OK) then
          ERROR(SelectCustErr);

        exit(Customer."No.");
    end;

    local procedure PickCustomer(var Customer : Record Customer;NoFiltersApplied : Boolean) : Code[20];
    var
        CustomerList : Page "Customer List";
    begin
        if not NoFiltersApplied then
          MarkCustomersByFilters(Customer);

        CustomerList.SETTABLEVIEW(Customer);
        CustomerList.SETRECORD(Customer);
        CustomerList.LOOKUPMODE := true;
        if CustomerList.RUNMODAL = ACTION::LookupOK then
          CustomerList.GETRECORD(Customer)
        else
          CLEAR(Customer);

        exit(Customer."No.");
    end;

    local procedure MarkCustomersByFilters(var Customer : Record Customer);
    begin
        if Customer.FINDSET then
          repeat
            Customer.MARK(true);
          until Customer.NEXT = 0;
        if Customer.FINDFIRST then;
        Customer.MARKEDONLY := true;
    end;

    [Scope('Personalization')]
    procedure OpenCustomerLedgerEntries(FilterOnDueEntries : Boolean);
    var
        DetailedCustLedgEntry : Record "Detailed Cust. Ledg. Entry";
        CustLedgerEntry : Record "Cust. Ledger Entry";
    begin
        DetailedCustLedgEntry.SETRANGE("Customer No.","No.");
        COPYFILTER("Global Dimension 1 Filter",DetailedCustLedgEntry."Initial Entry Global Dim. 1");
        COPYFILTER("Global Dimension 2 Filter",DetailedCustLedgEntry."Initial Entry Global Dim. 2");
        if FilterOnDueEntries and (GETFILTER("Date Filter") <> '') then begin
          COPYFILTER("Date Filter",DetailedCustLedgEntry."Initial Entry Due Date");
          DetailedCustLedgEntry.SETFILTER("Posting Date",'<=%1',GETRANGEMAX("Date Filter"));
        end;
        COPYFILTER("Currency Filter",DetailedCustLedgEntry."Currency Code");
        CustLedgerEntry.DrillDownOnEntries(DetailedCustLedgEntry);
    end;

    [Scope('Personalization')]
    procedure SetInsertFromTemplate(FromTemplate : Boolean);
    begin
        InsertFromTemplate := FromTemplate;
    end;

    [Scope('Personalization')]
    procedure IsLookupRequested() Result : Boolean;
    begin
        Result := LookupRequested;
        LookupRequested := false;
    end;

    local procedure IsContactUpdateNeeded() : Boolean;
    var
        UpdateNeeded : Boolean;
    begin
        UpdateNeeded :=
          (Name <> xRec.Name) or
          ("Search Name" <> xRec."Search Name") or
          ("Name 2" <> xRec."Name 2") or
          (Address <> xRec.Address) or
          ("Address 2" <> xRec."Address 2") or
          (City <> xRec.City) or
          ("Phone No." <> xRec."Phone No.") or
          ("Telex No." <> xRec."Telex No.") or
          ("Territory Code" <> xRec."Territory Code") or
          ("Currency Code" <> xRec."Currency Code") or
          ("Language Code" <> xRec."Language Code") or
          ("Salesperson Code" <> xRec."Salesperson Code") or
          ("Country/Region Code" <> xRec."Country/Region Code") or
          ("Fax No." <> xRec."Fax No.") or
          ("Telex Answer Back" <> xRec."Telex Answer Back") or
          ("VAT Registration No." <> xRec."VAT Registration No.") or
          ("Enterprise No." <> xRec."Enterprise No.") or
          ("Post Code" <> xRec."Post Code") or
          (County <> xRec.County) or
          ("E-Mail" <> xRec."E-Mail") or
          ("Home Page" <> xRec."Home Page") or
          (Contact <> xRec.Contact);

        OnBeforeIsContactUpdateNeeded(Rec,xRec,UpdateNeeded);
        exit(UpdateNeeded);
    end;

    local procedure CopyContactPicture(var Cont : Record Contact);
    var
        TempNameValueBuffer : Record "Name/Value Buffer" temporary;
        FileManagement : Codeunit "File Management";
        ExportPath : Text;
    begin
        if Image.HASVALUE then
          if not CONFIRM(OverrideImageQst) then
            exit;

        ExportPath := TEMPORARYPATH + Cont."No." + FORMAT(Cont.Image.MEDIAID);
        Cont.Image.EXPORTFILE(ExportPath);
        FileManagement.GetServerDirectoryFilesList(TempNameValueBuffer,TEMPORARYPATH);
        TempNameValueBuffer.SETFILTER(Name,STRSUBSTNO('%1*',ExportPath));
        TempNameValueBuffer.FINDFIRST;

        CLEAR(Image);
        Image.IMPORTFILE(TempNameValueBuffer.Name,'');
        MODIFY;
        if FileManagement.DeleteServerFile(TempNameValueBuffer.Name) then;
    end;

    local procedure SetDefaultSalesperson();
    var
        UserSetup : Record "User Setup";
    begin
        if not UserSetup.GET(USERID) then
          exit;

        if UserSetup."Salespers./Purch. Code" <> '' then
          VALIDATE("Salesperson Code",UserSetup."Salespers./Purch. Code");
    end;

    local procedure SetLastModifiedDateTime();
    begin
        "Last Modified Date Time" := CURRENTDATETIME;
        "Last Date Modified" := TODAY;
    end;

    local procedure VATRegistrationValidation();
    var
        VATRegistrationNoFormat : Record "VAT Registration No. Format";
        VATRegistrationLog : Record "VAT Registration Log";
        VATRegNoSrvConfig : Record "VAT Reg. No. Srv Config";
        VATRegistrationLogMgt : Codeunit "VAT Registration Log Mgt.";
        ResultRecordRef : RecordRef;
        ApplicableCountryCode : Code[10];
    begin
        if not VATRegistrationNoFormat.Test("VAT Registration No.","Country/Region Code","No.",DATABASE::Customer) then
          exit;
        VATRegistrationLogMgt.LogCustomer(Rec);
        if ("Country/Region Code" = '') and (VATRegistrationNoFormat."Country/Region Code" = '') then
          exit;
        ApplicableCountryCode := "Country/Region Code";
        if ApplicableCountryCode = '' then
          ApplicableCountryCode := VATRegistrationNoFormat."Country/Region Code";
        if VATRegNoSrvConfig.VATRegNoSrvIsEnabled then begin
          VATRegistrationLogMgt.ValidateVATRegNoWithVIES(ResultRecordRef,Rec,"No.",
            VATRegistrationLog."Account Type"::Customer,ApplicableCountryCode);
          ResultRecordRef.SETTABLE(Rec);
        end;
    end;

    procedure SetAddress(CustomerAddress : Text[50];CustomerAddress2 : Text[50];CustomerPostCode : Code[20];CustomerCity : Text[30];CustomerCounty : Text[30];CustomerCountryCode : Code[10];CustomerContact : Text[50]);
    begin
        Address := CustomerAddress;
        "Address 2" := CustomerAddress2;
        "Post Code" := CustomerPostCode;
        City := CustomerCity;
        County := CustomerCounty;
        "Country/Region Code" := CustomerCountryCode;
        UpdateContFromCust.OnModify(Rec);
        Contact := CustomerContact;
    end;

    procedure FindByEmail(var Customer : Record Customer;Email : Text) : Boolean;
    var
        LocalContact : Record Contact;
        ContactBusinessRelation : Record "Contact Business Relation";
        MarketingSetup : Record "Marketing Setup";
    begin
        Customer.SETRANGE("E-Mail",Email);
        if Customer.FINDFIRST then
          exit(true);

        Customer.SETRANGE("E-Mail");
        LocalContact.SETRANGE("E-Mail",Email);
        if LocalContact.FINDSET then begin
          MarketingSetup.GET;
          repeat
            if ContactBusinessRelation.GET(LocalContact."No.",MarketingSetup."Bus. Rel. Code for Customers") then begin
              Customer.GET(ContactBusinessRelation."No.");
              exit(true);
            end;
          until LocalContact.NEXT = 0
        end;
    end;

    local procedure UpdateCurrencyCode();
    var
        Currency : Record Currency;
    begin
        if not ISNULLGUID("Currency Id") then begin
          Currency.SETRANGE(Id,"Currency Id");
          Currency.FINDFIRST;
        end;

        VALIDATE("Currency Code",Currency.Code);
    end;

    local procedure UpdatePaymentTermsCode();
    var
        PaymentTerms : Record "Payment Terms";
    begin
        if not ISNULLGUID("Payment Terms Id") then begin
          PaymentTerms.SETRANGE(Id,"Payment Terms Id");
          PaymentTerms.FINDFIRST;
        end;

        VALIDATE("Payment Terms Code",PaymentTerms.Code);
    end;

    local procedure UpdateShipmentMethodCode();
    var
        ShipmentMethod : Record "Shipment Method";
    begin
        if not ISNULLGUID("Shipment Method Id") then begin
          ShipmentMethod.SETRANGE(Id,"Shipment Method Id");
          ShipmentMethod.FINDFIRST;
        end;

        VALIDATE("Shipment Method Code",ShipmentMethod.Code);
    end;

    local procedure UpdatePaymentMethodCode();
    var
        PaymentMethod : Record "Payment Method";
    begin
        if not ISNULLGUID("Payment Method Id") then begin
          PaymentMethod.SETRANGE(Id,"Payment Method Id");
          PaymentMethod.FINDFIRST;
        end;

        VALIDATE("Payment Method Code",PaymentMethod.Code);
    end;

    procedure UpdateCurrencyId();
    var
        Currency : Record Currency;
    begin
        if "Currency Code" = '' then begin
          CLEAR("Currency Id");
          exit;
        end;

        if not Currency.GET("Currency Code") then
          exit;

        "Currency Id" := Currency.Id;
    end;

    procedure UpdatePaymentTermsId();
    var
        PaymentTerms : Record "Payment Terms";
    begin
        if "Payment Terms Code" = '' then begin
          CLEAR("Payment Terms Id");
          exit;
        end;

        if not PaymentTerms.GET("Payment Terms Code") then
          exit;

        "Payment Terms Id" := PaymentTerms.Id;
    end;

    procedure UpdateShipmentMethodId();
    var
        ShipmentMethod : Record "Shipment Method";
    begin
        if "Shipment Method Code" = '' then begin
          CLEAR("Shipment Method Id");
          exit;
        end;

        if not ShipmentMethod.GET("Shipment Method Code") then
          exit;

        "Shipment Method Id" := ShipmentMethod.Id;
    end;

    procedure UpdatePaymentMethodId();
    var
        PaymentMethod : Record "Payment Method";
    begin
        if "Payment Method Code" = '' then begin
          CLEAR("Payment Method Id");
          exit;
        end;

        if not PaymentMethod.GET("Payment Method Code") then
          exit;

        "Payment Method Id" := PaymentMethod.Id;
    end;

    procedure UpdateTaxAreaId();
    var
        VATBusinessPostingGroup : Record "VAT Business Posting Group";
        TaxArea : Record "Tax Area";
        GeneralLedgerSetup : Record "General Ledger Setup";
    begin
        if GeneralLedgerSetup.UseVat then begin
          if "VAT Bus. Posting Group" = '' then begin
            CLEAR("Tax Area ID");
            exit;
          end;

          if not VATBusinessPostingGroup.GET("VAT Bus. Posting Group") then
            exit;

          "Tax Area ID" := VATBusinessPostingGroup.Id;
        end else begin
          if "Tax Area Code" = '' then begin
            CLEAR("Tax Area ID");
            exit;
          end;

          if not TaxArea.GET("Tax Area Code") then
            exit;

          "Tax Area ID" := TaxArea.Id;
        end;
    end;

    local procedure UpdateTaxAreaCode();
    var
        TaxArea : Record "Tax Area";
        VATBusinessPostingGroup : Record "VAT Business Posting Group";
        GeneralLedgerSetup : Record "General Ledger Setup";
    begin
        if ISNULLGUID("Tax Area ID") then
          exit;

        if GeneralLedgerSetup.UseVat then begin
          VATBusinessPostingGroup.SETRANGE(Id,"Tax Area ID");
          VATBusinessPostingGroup.FINDFIRST;
          "VAT Bus. Posting Group" := VATBusinessPostingGroup.Code;
        end else begin
          TaxArea.SETRANGE(Id,"Tax Area ID");
          TaxArea.FINDFIRST;
          "Tax Area Code" := TaxArea.Code;
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure SkipRenamingLogic(var SkipRename : Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeIsContactUpdateNeeded(Customer : Record Customer;xCustomer : Record Customer;var UpdateNeeded : Boolean);
    begin
    end;
}

