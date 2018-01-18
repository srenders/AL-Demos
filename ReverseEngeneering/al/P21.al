page 21 "Customer Card"
{
    // version NAVW111.00,NAVBE11.00

    CaptionML = ENU='Customer Card',
                FRB='Fiche client',
                NLB='Klantenkaart';
    PageType = Card;
    PromotedActionCategoriesML = ENU='New,Process,Report,New Document,Approve,Request Approval,Prices and Discounts,Navigate,Customer',
                                 FRB='Nouveau,Traiter,Déclarer,Nouveau Document,Approuver,Demander une approbation,Prix et remises,Naviguer,Client',
                                 NLB='Nieuw,Verwerken,Rapporteren,Nieuw document,Goedkeuren,Goedkeuring aanvragen,Prijzen en kortingen,Navigeren,Klant';
    RefreshOnActivate = true;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRB='Général',
                            NLB='Algemeen';
                field("No.";"No.")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.',
                                FRB='Spécifie le numéro du client. Le champ est renseigné automatiquement à partir d''une souche de numéros définie, ou vous saisissez manuellement le numéro, car vous avez activé la saisie manuelle de numéro dans le paramétrage de la souche de numéros.',
                                NLB='Hiermee wordt het nummer van de klant opgegeven. Het veld wordt automatisch ingevuld op basis van een gedefinieerde nummerreeks of u voert het nummer handmatig in omdat u handmatig invoeren in de nummerreeksinstellingen hebt ingeschakeld.';
                    Visible = NoFieldVisible;

                    trigger OnAssistEdit();
                    begin
                        if AssistEdit(xRec) then
                          CurrPage.UPDATE;
                    end;
                }
                field(Name;Name)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTipML = ENU='Specifies the customer''s name. This name will appear on all sales documents for the customer. You can enter a maximum of 50 characters, both numbers and letters.',
                                FRB='Spécifie le nom du client. Ce nom apparaîtra sur tous les documents vente destinés au client. Vous pouvez entrer au maximum 50 caractères, des chiffres et des lettres.',
                                NLB='Hiermee wordt de naam van de klant opgegeven. Deze naam wordt op alle verkoopdocumenten voor de klant weergegeven. U kunt maximaal 50 tekens (cijfers en letters) invoeren.';
                }
                field("Search Name";"Search Name")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies an alternate name that you can use to search for a customer.',
                                FRB='Spécifie un autre nom que vous pouvez utiliser pour chercher un client.',
                                NLB='Hiermee wordt een alternatieve naam opgegeven die u kunt gebruiken om een klant te zoeken.';
                    Visible = false;
                }
                field("IC Partner Code";"IC Partner Code")
                {
                    ApplicationArea = Intercompany;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the customer''s intercompany partner code.',
                                FRB='Spécifie le code partenaire intersociété du client.',
                                NLB='Hiermee wordt de IC-partnercode van de klant opgegeven.';
                }
                field("Balance (LCY)";"Balance (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.',
                                FRB='Spécifie le montant règlement que le client doit régler pour les ventes réalisées. Cette valeur est également appelée le solde du client.',
                                NLB='Hiermee wordt het betalingsbedrag opgegeven dat de klant voor afgesloten verkoop verschuldigd is. Deze waarde wordt ook het saldo van de klant genoemd.';

                    trigger OnDrillDown();
                    begin
                        OpenCustomerLedgerEntries(false);
                    end;
                }
                field("Balance Due (LCY)";"Balance Due (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies payments from the customer that are overdue per today''s date.',
                                FRB='Spécifie les paiements effectués par le client échus pour la date du jour.',
                                NLB='Hiermee worden betalingen van de klant opgegeven die op de datum van vandaag achterstallig zijn.';

                    trigger OnDrillDown();
                    begin
                        OpenCustomerLedgerEntries(true);
                    end;
                }
                field("Credit Limit (LCY)";"Credit Limit (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    StyleExpr = StyleTxt;
                    ToolTipML = ENU='Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.',
                                FRB='Spécifie le montant maximal selon lequel vous autorisez au client à dépasser le solde de paiement avant que des alertes ne soient émises.',
                                NLB='Hiermee wordt het maximale bedrag opgegeven waarmee de klant het betaalsaldo mag overschrijden voordat waarschuwingen worden verzonden.';

                    trigger OnValidate();
                    begin
                        StyleTxt := SetStyle;
                    end;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies which transactions with the customer that cannot be blocked, for example, because the customer is insolvent.',
                                FRB='Spécifie les transactions avec le client qui ne peuvent pas être bloquées, par exemple, parce que le client est déclaré insolvable.',
                                NLB='Hiermee wordt opgegeven welke transacties met de klant niet kunnen worden geblokkeerd, bijvoorbeeld omdat de klant insolvent is.';
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies a code for the salesperson who normally handles this customer''s account.',
                                FRB='Spécifie un code pour le vendeur qui s''occupe habituellement du compte de ce client.',
                                NLB='Hiermee wordt een code opgegeven voor de verkoper die de rekening van deze klant normaal gesproken behandelt.';
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the code for the responsibility center that will administer this customer by default.',
                                FRB='Spécifie le code du centre de gestion qui gère ce client par défaut.',
                                NLB='Hiermee wordt de code opgegeven voor de divisie die deze klant standaard beheert.';
                }
                field("Service Zone Code";"Service Zone Code")
                {
                    ApplicationArea = Service;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the code for the service zone that is assigned to the customer.',
                                FRB='Spécifie le code de la zone service affecté au client.',
                                NLB='Hiermee wordt de code opgegeven voor de serviceregio die aan de klant is toegewezen.';
                }
                field("Document Sending Profile";"Document Sending Profile")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the preferred method of sending documents to this customer, so that you do not have to select a sending option every time that you post and send a document to the customer. Sales documents to this customer will be sent using the specified sending profile and will override the default document sending profile.',
                                FRB='Spécifie la méthode préférée d''envoi de documents à ce client afin que vous n''ayez pas à sélectionner une option d''envoi chaque fois que vous validez et envoyez un document au client. Les documents vente à ce client seront envoyés en utilisant le profil d''envoi spécifié et remplaceront le profil d''envoi de document par défaut.',
                                NLB='Hiermee wordt de voorkeursmethode opgegeven voor het verzenden van documenten naar deze klant, zodat u niet steeds een verzendoptie hoeft te selecteren wanneer u een document boekt en naar de klant verzendt. Verkoopdocumenten worden naar deze klant verzonden met behulp van het opgegeven verzendprofiel. Dit overschrijft het standaardverzendprofiel van documenten.';
                }
                field(TotalSales2;GetTotalSales)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Total Sales',
                                FRB='Total des ventes',
                                NLB='Totale verkoop';
                    Style = Strong;
                    StyleExpr = TRUE;
                    ToolTipML = ENU='Specifies your total sales turnover with the customer in the current fiscal year. It is calculated from amounts excluding VAT on all completed and open invoices and credit memos.',
                                FRB='Spécifie votre rotation totale des ventes avec le client au cours de l''exercice comptable en cours. Il est calculé à partir des montants HT sur toutes les factures et avoirs terminés et ouverts.',
                                NLB='Hiermee wordt uw totale verkoopomzet met de klant in het huidige boekjaar opgegeven. Dit wordt berekend op basis van bedragen exclusief btw van alle voltooide en open facturen en creditnota''s.';
                }
                field("CustSalesLCY - CustProfit - AdjmtCostLCY";CustSalesLCY - CustProfit - AdjmtCostLCY)
                {
                    ApplicationArea = Basic,Suite;
                    AutoFormatType = 1;
                    CaptionML = ENU='Costs (LCY)',
                                FRB='Coûts DS',
                                NLB='Kosten (LV)';
                    ToolTipML = ENU='Specifies how much cost you have incurred from the customer in the current fiscal year.',
                                FRB='Spécifie les coûts que vous avez subis pour le client pour l''exercice comptable en cours.',
                                NLB='Hiermee wordt opgegeven hoeveel kosten u voor een klant hebt gemaakt in het huidige boekjaar.';
                }
                field(AdjCustProfit;AdjCustProfit)
                {
                    ApplicationArea = Basic,Suite;
                    AutoFormatType = 1;
                    CaptionML = ENU='Profit (LCY)',
                                FRB='Marge DS',
                                NLB='Winst (LV)';
                    Editable = false;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies how much profit you have made from the customer in the current fiscal year.',
                                FRB='Spécifie la marge que vous avez réalisée pour le client pour l''exercice comptable en cours.',
                                NLB='Hiermee wordt opgegeven hoeveel winst u op een klant hebt gemaakt in het huidige boekjaar.';
                }
                field(AdjProfitPct;AdjProfitPct)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Profit %',
                                FRB='% marge sur vente',
                                NLB='Winst %';
                    DecimalPlaces = 1:1;
                    Editable = false;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies how much profit you have made from the customer in the current fiscal year, expressed as a percentage of the customer''s total sales.',
                                FRB='Spécifie la marge que vous avez réalisée pour le client pour l''exercice comptable en cours, exprimée en pourcentage des ventes totales du client.',
                                NLB='Hiermee wordt opgegeven hoeveel winst u op de klant hebt gemaakt in het huidige boekjaar, uitgedrukt als een percentage van de totale verkoop aan de klant.';
                }
                field("Enterprise No.";"Enterprise No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer''s enterprise number.',
                                FRB='Spécifie le numéro d''entreprise du client.',
                                NLB='Hiermee wordt het ondernemersnummer van de klant aangegeven.';
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies when the customer card was last modified.',
                                FRB='Indique la date à laquelle la fiche client a été modifiée pour la dernière fois.',
                                NLB='Hiermee wordt opgegeven wanneer de klantenkaart het laatst is gewijzigd.';
                }
            }
            group("Address & Contact")
            {
                CaptionML = ENU='Address & Contact',
                            FRB='Adresse et contact',
                            NLB='Adres en contactpersoon';
                group(AddressDetails)
                {
                    CaptionML = ENU='Address',
                                FRB='Adresse',
                                NLB='Adres';
                    field(Address;Address)
                    {
                        ApplicationArea = Basic,Suite;
                        ToolTipML = ENU='Specifies the customer''s address. This address will appear on all sales documents for the customer.',
                                    FRB='Spécifie l''adresse du client. Cette adresse s''affiche sur tous les documents de vente pour le client.',
                                    NLB='Hiermee wordt het adres van de klant opgegeven. Dit adres wordt op alle verkoopdocumenten voor de klant weergegeven.';
                    }
                    field("Address 2";"Address 2")
                    {
                        ApplicationArea = Basic,Suite;
                        ToolTipML = ENU='Specifies additional address information.',
                                    FRB='Spécifie des informations d''adresse supplémentaires.',
                                    NLB='Hiermee wordt aanvullende adresinformatie opgegeven.';
                    }
                    field("Post Code";"Post Code")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Promoted;
                        ToolTipML = ENU='Specifies the postal code.',
                                    FRB='Spécifie le code postal.',
                                    NLB='Hiermee wordt de postcode opgegeven.';
                    }
                    field(City;City)
                    {
                        ApplicationArea = Basic,Suite;
                        ToolTipML = ENU='Specifies the customer''s city.',
                                    FRB='Spécifie la ville du client.',
                                    NLB='Hiermee wordt de plaats van de klant opgegeven.';
                    }
                    field("Country/Region Code";"Country/Region Code")
                    {
                        ApplicationArea = Basic,Suite;
                        ToolTipML = ENU='Specifies the country/region of the address.',
                                    FRB='Spécifie le pays/la région de l''adresse.',
                                    NLB='Hiermee wordt het land of de regio van het adres opgegeven.';
                    }
                    field(ShowMap;ShowMapLbl)
                    {
                        ApplicationArea = Basic,Suite;
                        Editable = false;
                        ShowCaption = false;
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                        ToolTipML = ENU='Specifies the customer''s address on your preferred map website.',
                                    FRB='Spécifie l''adresse du client sur votre site Web de mappage par défaut.',
                                    NLB='Hiermee wordt het adres van de klant opgegeven op de kaartenwebsite van uw voorkeur.';

                        trigger OnDrillDown();
                        begin
                            CurrPage.UPDATE(true);
                            DisplayMap;
                        end;
                    }
                }
                group(ContactDetails)
                {
                    CaptionML = ENU='Contact',
                                FRB='Contact',
                                NLB='Contactpersoon';
                    field("Primary Contact No.";"Primary Contact No.")
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Primary Contact Code',
                                    FRB='Code contact principal',
                                    NLB='Code van primaire contactpersoon';
                        ToolTipML = ENU='Specifies the primary contact number for the customer.',
                                    FRB='Spécifie le numéro de contact principal du client.',
                                    NLB='Hiermee wordt het primaire contactnummer opgegeven van de klant.';
                    }
                    field(ContactName;Contact)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Contact Name',
                                    FRB='Nom contact',
                                    NLB='Naam van contactpersoon';
                        Editable = ContactEditable;
                        Importance = Promoted;
                        ToolTipML = ENU='Specifies the name of the person you regularly contact when you do business with this customer.',
                                    FRB='Spécifie le nom de la personne que vous contactez régulièrement lorsque vous traitez avec ce client.',
                                    NLB='Hiermee wordt de naam opgegeven van de persoon met wie u regelmatig contact opneemt wanneer u zaken met deze klant doet.';

                        trigger OnValidate();
                        begin
                            ContactOnAfterValidate;
                        end;
                    }
                    field("Phone No.";"Phone No.")
                    {
                        ApplicationArea = Basic,Suite;
                        ToolTipML = ENU='Specifies the customer''s telephone number.',
                                    FRB='Spécifie le numéro de téléphone du client.',
                                    NLB='Hiermee wordt het telefoonnummer van de klant opgegeven.';
                    }
                    field("E-Mail";"E-Mail")
                    {
                        ApplicationArea = Basic,Suite;
                        ExtendedDatatype = EMail;
                        Importance = Promoted;
                        ToolTipML = ENU='Specifies the customer''s email address.',
                                    FRB='Spécifie l''adresse de messagerie du client.',
                                    NLB='Hiermee wordt het e-mailadres van de klant opgegeven.';
                    }
                    field("Fax No.";"Fax No.")
                    {
                        ApplicationArea = Advanced;
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the customer''s fax number.',
                                    FRB='Spécifie le numéro de télécopie du client.',
                                    NLB='Hiermee wordt het faxnummer van de klant opgegeven.';
                    }
                    field("Home Page";"Home Page")
                    {
                        ApplicationArea = Basic,Suite;
                        ToolTipML = ENU='Specifies the customer''s home page address.',
                                    FRB='Spécifie la page d''accueil du client.',
                                    NLB='Hiermee wordt het adres van de startpagina van de klant opgegeven.';
                    }
                    field("Language Code";"Language Code")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the language to be used on printouts for this customer.',
                                    FRB='Spécifie la langue à utiliser sur des impressions destinées à ce client.',
                                    NLB='Hiermee wordt de taal opgegeven die moet worden gebruikt op afdrukken voor deze klant.';
                    }
                }
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRB='Facturation',
                            NLB='Facturering';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Bill-to Customer',
                                FRB='Client facturé',
                                NLB='Factuurklant';
                    Importance = Additional;
                    ToolTipML = ENU='Specifies a different customer who will be invoiced for products that you sell to the customer in the Name field on the customer card.',
                                FRB='Spécifiez un autre client qui sera facturé pour les produits que vous vendez au client dans le champ Nom de la fiche client.',
                                NLB='Hiermee wordt een andere klant opgegeven die wordt gefactureerd voor producten die u verkoopt aan de klant in het veld Naam op de klantenkaart.';
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the customer''s VAT registration number for customers in EU countries/regions.',
                                FRB='Spécifie le numéro d''identification intra-communautaire du client dans des pays/régions de l''Union européenne.',
                                NLB='Hiermee wordt het btw-nummer van de klant opgegeven voor klanten in EU-landen/regio''s.';

                    trigger OnDrillDown();
                    var
                        VATRegistrationLogMgt : Codeunit "VAT Registration Log Mgt.";
                    begin
                        VATRegistrationLogMgt.AssistEditCustomerVATReg(Rec);
                    end;
                }
                field(GLN;GLN)
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the customer in connection with electronic document sending.',
                                FRB='Spécifie le client en relation avec l''envoi de documents électroniques.',
                                NLB='Hiermee wordt de klant opgegeven in verband met de verzending van elektronische documenten.';
                }
                field("Copy Sell-to Addr. to Qte From";"Copy Sell-to Addr. to Qte From")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies which customer address is inserted on sales quotes that you create for the customer.',
                                FRB='Spécifie que l''adresse client est insérée sur les devis que vous créez pour ce client.',
                                NLB='Hiermee wordt opgegeven welk klantenadres wordt ingevoegd op verkoopoffertes die u voor de klant maakt.';
                }
                field("Invoice Copies";"Invoice Copies")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies how many copies of an invoice for the customer will be printed at a time.',
                                FRB='Spécifie le nombre de copies imprimées à la fois pour une facture pour le client.',
                                NLB='Hiermee wordt opgegeven hoeveel kopieën van een factuur tegelijk voor de klant worden afgedrukt.';
                }
                group(PostingDetails)
                {
                    CaptionML = ENU='Posting Details',
                                FRB='Détails de validation',
                                NLB='Boekingsgegevens';
                    field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Promoted;
                        ShowMandatory = true;
                        ToolTipML = ENU='Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.',
                                    FRB='Spécifie le type commercial du client pour lier les transactions effectuées pour ce client au compte général approprié en fonction des paramètres de validation généraux.',
                                    NLB='Hiermee wordt het handelstype van de klant opgegeven om transacties die voor deze klant zijn gemaakt, aan de juiste grootboekrekening te koppelen volgens de algemene boekingsinstelling.';
                    }
                    field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the customer''s VAT specification to link transactions made for this customer to.',
                                    FRB='Spécifie le détail TVA du client auquel associer des transactions faites pour ce client.',
                                    NLB='Hiermee wordt de btw-specificatie van de klant opgegeven om voor deze klant uitgevoerde transacties aan te koppelen.';
                    }
                    field("Customer Posting Group";"Customer Posting Group")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Promoted;
                        ShowMandatory = true;
                        ToolTipML = ENU='Specifies the customer''s market type to link business transactions to.',
                                    FRB='Spécifie le type de marché du client auquel associer des transactions commerciales.',
                                    NLB='Hiermee wordt het marktsoort van de klant opgegeven om bedrijfstransacties aan te koppelen.';
                    }
                }
                group(PricesandDiscounts)
                {
                    CaptionML = ENU='Prices and Discounts',
                                FRB='Prix et remises',
                                NLB='Prijzen en kortingen';
                    field("Currency Code";"Currency Code")
                    {
                        ApplicationArea = Suite;
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the default currency for the customer.',
                                    FRB='Spécifie la devise par défaut pour le client.',
                                    NLB='Hiermee wordt de standaardvalutacode voor de klant opgegeven.';
                    }
                    field("Customer Price Group";"Customer Price Group")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Promoted;
                        ToolTipML = ENU='Specifies the customer price group code, which you can use to set up special sales prices in the Sales Prices window.',
                                    FRB='Spécifie le code groupe prix client que vous pouvez utiliser pour configurer des prix spécifiques dans la fenêtre Prix vente.',
                                    NLB='Hiermee wordt de code opgegeven van de klantenprijsgroep die u kunt gebruiken om speciale verkoopprijzen in te stellen in het venster Verkoopprijzen.';
                    }
                    field("Customer Disc. Group";"Customer Disc. Group")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Promoted;
                        ToolTipML = ENU='Specifies the customer discount group code, which you can use as a criterion to set up special discounts in the Sales Line Discounts window.',
                                    FRB='Spécifie le code groupe remises client que vous pouvez utiliser comme critère pour configurer des remises spécifiques dans la fenêtre Remises ligne vente.',
                                    NLB='Hiermee wordt de code opgegeven van de klantenkortingsgroep die u kunt gebruiken als criterium om speciale kortingen in te stellen in het venster Verkoopregelkortingen.';
                    }
                    field("Allow Line Disc.";"Allow Line Disc.")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Additional;
                        ToolTipML = ENU='Specifies if a sales line discount is calculated when a special sales price is offered according to setup in the Sales Prices window.',
                                    FRB='Spécifie si une remise ligne vente est calculée lorsqu''un prix vente spécial est proposé en fonction du paramétrage de la fenêtre Prix vente.',
                                    NLB='Hiermee wordt opgegeven of een verkoopregelkorting wordt berekend als een speciale prijs wordt aangeboden volgens de instelling in het venster Verkoopprijzen.';
                    }
                    field("Invoice Disc. Code";"Invoice Disc. Code")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Additional;
                        NotBlank = true;
                        ToolTipML = ENU='Specifies a code for the invoice discount terms that you have defined for the customer.',
                                    FRB='Spécifie un code pour les conditions de remise facture que vous avez définies pour le client.',
                                    NLB='Hiermee wordt een code opgegeven voor de factuurkortingsvoorwaarden die u voor de klant hebt gedefinieerd.';
                    }
                    field("Prices Including VAT";"Prices Including VAT")
                    {
                        ApplicationArea = Basic,Suite;
                        Importance = Additional;
                        ToolTipML = ENU='Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.',
                                    FRB='Spécifie si les champs Prix unitaire et Montant ligne sur les lignes document vente doivent être affichés avec ou sans la TVA.',
                                    NLB='Hiermee wordt opgegeven of de velden Eenheidsprijs en Regelbedrag op documentregels met of zonder btw moeten worden weergegeven.';
                    }
                }
            }
            group(Payments)
            {
                CaptionML = ENU='Payments',
                            FRB='Paiements',
                            NLB='Betalingen';
                field("Prepayment %";"Prepayment %")
                {
                    ApplicationArea = Prepayments;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies a prepayment percentage that applies to all orders for this customer, regardless of the items or services on the order lines.',
                                FRB='Spécifie un pourcentage acompte s''appliquant à toutes les commandes de ce client, indépendamment des articles ou des services figurant sur les lignes commande.',
                                NLB='Hiermee wordt een vooruitbetalingspercentage opgegeven dat geldt voor alle orders voor deze klant, ongeacht de artikelen of services op de orderregels.';
                }
                field("Application Method";"Application Method")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies how to apply payments to entries for this customer.',
                                FRB='Spécifie la manière de lettrer des paiements avec des écritures pour ce client.',
                                NLB='Hiermee wordt opgegeven hoe betalingen moeten worden vereffend met posten voor deze klant.';
                }
                field("Partner Type";"Partner Type")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies for direct debit collections if the customer that the payment is collected from is a person or a company.',
                                FRB='Spécifie, pour les recouvrements prélèvement, si le client auprès duquel le paiement est collecté est une personne ou une société.',
                                NLB='Hiermee wordt voor incasso-opdrachten opgegeven of de klant van wie de betaling wordt geïnd, een persoon of een bedrijf is.';
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTipML = ENU='Specifies a code that indicates the payment terms that you require of the customer.',
                                FRB='Spécifie un code qui indique les conditions de paiement que vous exigez du client.',
                                NLB='Hiermee wordt een code opgegeven die aangeeft welke betalingsvoorwaarden u van de klant vereist.';
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies how the customer usually submits payment, such as bank transfer or check.',
                                FRB='Spécifie le mode de paiement généralement utilisé par le client, tel que par virement bancaire ou par chèque.',
                                NLB='Hiermee wordt opgegeven hoe de klant gewoonlijk betaling verzendt, zoals bankoverboeking of cheque.';
                }
                field("Reminder Terms Code";"Reminder Terms Code")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies how reminders about late payments are handled for this customer.',
                                FRB='Spécifie la manière dont les relances concernant les retards de paiement sont traitées pour ce client.',
                                NLB='Hiermee wordt opgegeven hoe aanmaningen voor te late betalingen voor deze klant worden verwerkt.';
                }
                field("Fin. Charge Terms Code";"Fin. Charge Terms Code")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies finance charges are calculated for the customer.',
                                FRB='Spécifie les intérêts calculés pour le client.',
                                NLB='Hiermee worden rentefacturen opgegeven die voor de klant worden berekend.';
                }
                field("Cash Flow Payment Terms Code";"Cash Flow Payment Terms Code")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies a payment term that will be used to calculate cash flow for the customer.',
                                FRB='Spécifie les conditions de paiement qui serviront à calculer la trésorerie pour le client.',
                                NLB='Hiermee wordt een betalingsvoorwaarde opgegeven die wordt gebruikt om de cashflow te berekenen voor de klant.';
                }
                field("Domiciliation No.";"Domiciliation No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the domiciliation number for the customer.',
                                FRB='Spécifie le numéro de domiciliation du client.',
                                NLB='Hiermee wordt het domiciliëringsnummer voor de klant aangegeven.';
                }
                field("Print Statements";"Print Statements")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies whether to include this customer when you print the Statement report.',
                                FRB='Spécifie s''il faut inclure ou non ce client lorsque vous imprimez le relevé de compte.',
                                NLB='Hiermee wordt opgegeven of u deze klant wilt opnemen wanneer u het rapport Rekeningoverzicht afdrukt.';
                }
                field("Last Statement No.";"Last Statement No.")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the number of the last statement that was printed for this customer.',
                                FRB='Spécifie le numéro du dernier relevé imprimé pour ce client.',
                                NLB='Hiermee wordt het nummer opgegeven van het laatste afschrift dat voor deze klant is afgedrukt.';
                }
                field("Block Payment Tolerance";"Block Payment Tolerance")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies that the customer is not allowed a payment tolerance.',
                                FRB='Spécifie que le client n''a droit à aucun écart de règlement.',
                                NLB='Hiermee wordt opgegeven dat de klant niet in aanmerking komt voor betalingstolerantie.';
                }
                field("Preferred Bank Account Code";"Preferred Bank Account Code")
                {
                    ApplicationArea = Basic,Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the customer''s bank account that will be used by default when you process refunds to the customer and direct debit collections.',
                                FRB='Spécifie le compte bancaire client qui sera utilisé par défaut lorsque vous traitez des remboursements client et des collections prélèvement automatique.',
                                NLB='Hiermee wordt de bankrekening van de klant opgegeven die standaard wordt gebruikt wanneer u terugbetalingen aan de klant en incasso-opdrachten verwerkt.';
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRB='Livraison',
                            NLB='Verzending';
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies from which location sales to this customer will be processed by default.',
                                FRB='Spécifie à partir de quel magasin les ventes à ce client seront traitées par défaut.',
                                NLB='Hiermee wordt opgegeven vanaf welke locatie verkopen aan deze klant standaard worden verwerkt.';
                }
                field("Combine Shipments";"Combine Shipments")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies if several orders delivered to the customer can appear on the same sales invoice.',
                                FRB='Spécifie si plusieurs commandes livrées au client peuvent se trouver sur la même facture vente.',
                                NLB='Hiermee wordt opgegeven of meerdere orders die aan de klant worden geleverd, in dezelfde verkoopfactuur kunnen worden opgenomen.';
                }
                field(Reserve;Reserve)
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies whether items will never, automatically (Always), or optionally be reserved for this customer.',
                                FRB='Spécifie si les articles ne seront jamais réservés ou seront réservés automatiquement (toujours) ou éventuellement pour ce client.',
                                NLB='Hiermee wordt opgegeven of artikelen nooit, automatisch (altijd) of optioneel voor deze klant worden gereserveerd.';
                }
                field("Shipping Advice";"Shipping Advice")
                {
                    ApplicationArea = Advanced;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies if the customer accepts partial shipment of orders.',
                                FRB='Spécifie si le client accepte l''expédition partielle des commandes.',
                                NLB='Hiermee wordt opgegeven of de klant een gedeeltelijke verzending van orders accepteert.';
                }
                group("Shipment Method")
                {
                    CaptionML = ENU='Shipment Method',
                                FRB='Conditions de livraison',
                                NLB='Verzendwijze';
                    field("Shipment Method Code";"Shipment Method Code")
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Code',
                                    FRB='Code',
                                    NLB='Code';
                        Importance = Promoted;
                        ToolTipML = ENU='Specifies which shipment method to use when you ship items to the customer.',
                                    FRB='Spécifie les conditions de livraison à utiliser lorsque vous livrez des articles à ce client.',
                                    NLB='Hiermee wordt opgegeven welke verzendwijze moet worden gebruikt wanneer u artikelen naar de klant verzendt.';
                    }
                    field("Shipping Agent Code";"Shipping Agent Code")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Agent',
                                    FRB='Transporteur',
                                    NLB='Expediteur';
                        Importance = Additional;
                        ToolTipML = ENU='Specifies which shipping company is used when you ship items to the customer.',
                                    FRB='Spécifie le transporteur utilisé lorsque vous livrez des articles à ce client.',
                                    NLB='Hiermee wordt opgegeven welke expediteur wordt gebruikt wanneer u artikelen naar de klant verzendt.';
                    }
                    field("Shipping Agent Service Code";"Shipping Agent Service Code")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Agent Service',
                                    FRB='Prestation transporteur',
                                    NLB='Service van expediteur';
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the code for the shipping agent service to use for this customer.',
                                    FRB='Spécifie le code prestation transporteur à utiliser pour ce client.',
                                    NLB='Hiermee wordt de code opgegeven voor de expediteurservice die voor deze klant moet worden gebruikt.';
                    }
                }
                field("Shipping Time";"Shipping Time")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.',
                                FRB='Spécifie le délai nécessaire entre le moment de l''expédition des articles à partir de l''entrepôt et la livraison.',
                                NLB='Hiermee wordt opgegeven hoe lang het duurt vanaf het moment dat de artikelen worden verzonden uit het magazijn tot het moment dat de artikelen worden geleverd.';
                }
                field("Base Calendar Code";"Base Calendar Code")
                {
                    ApplicationArea = Advanced;
                    DrillDown = false;
                    ToolTipML = ENU='Specifies a customizable calendar for shipment planning that holds the customer''s working days and holidays.',
                                FRB='Spécifie un calendrier personnalisable pour la planification d''expédition qui contient les vacances et jours ouvrés du client.',
                                NLB='Hiermee wordt een aanpasbare agenda voor planning van verzending opgegeven die de werkdagen en vakantiedagen van de klant bevat.';
                }
                field("Customized Calendar";CalendarMgmt.CustomizedCalendarExistText(CustomizedCalendar."Source Type"::Customer,"No.",'',"Base Calendar Code"))
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Customized Calendar',
                                FRB='Calendrier personnalisé',
                                NLB='Gepersonaliseerde agenda';
                    Editable = false;
                    ToolTipML = ENU='Specifies that you have set up a customized version of a base calendar.',
                                FRB='Spécifie que vous avez configuré une version personnalisée d''un calendrier de base.',
                                NLB='Hiermee wordt opgegeven dat u een aangepaste versie van een basisagenda hebt ingesteld.';

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        TESTFIELD("Base Calendar Code");
                        CalendarMgmt.ShowCustomizedCalendar(CustomizedCalEntry."Source Type"::Customer,"No.",'',"Base Calendar Code");
                    end;
                }
            }
            group(Statistics)
            {
                CaptionML = ENU='Statistics',
                            FRB='Statistiques',
                            NLB='Statistiek';
                Editable = false;
                Visible = FoundationOnly;
                group(Balance)
                {
                    CaptionML = ENU='Balance',
                                FRB='Solde',
                                NLB='Saldo';
                    field("Balance (LCY)2";"Balance (LCY)")
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Money Owed - Current',
                                    FRB='Montant dû - Actuel',
                                    NLB='Geld verschuldigd - Huidig';
                        ToolTipML = ENU='Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.',
                                    FRB='Spécifie le montant règlement que le client doit régler pour les ventes terminées. Cette valeur est également appelée le solde du client.',
                                    NLB='Hiermee wordt het betalingsbedrag opgegeven dat de klant voor afgesloten verkoop verschuldigd is. Deze waarde wordt ook het saldo van de klant genoemd.';

                        trigger OnDrillDown();
                        begin
                            OpenCustomerLedgerEntries(false);
                        end;
                    }
                    field(GetMoneyOwedExpected;GetMoneyOwedExpected)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Money Owed - Expected',
                                    FRB='Montant dû - Prévu',
                                    NLB='Geld verschuldigd - Verwacht';
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the payment amount that the customer will owe when ongoing sales invoices and credit memos are completed.',
                                    FRB='Spécifie le montant règlement que le client doit lorsque les factures vente et les avoirs en cours sont terminés.',
                                    NLB='Hiermee wordt het betalingsbedrag opgegeven dat de klant verschuldigd is wanneer doorlopende verkoopfacturen en creditnota''s worden voltooid.';

                        trigger OnDrillDown();
                        begin
                            CustomerMgt.DrillDownMoneyOwedExpected("No.");
                        end;
                    }
                    field(TotalMoneyOwed;"Balance (LCY)" + GetMoneyOwedExpected)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Money Owed - Total',
                                    FRB='Montant dû - Total',
                                    NLB='Geld verschuldigd - Totaal';
                        Style = Strong;
                        StyleExpr = TRUE;
                        ToolTipML = ENU='Specifies the payment amount that the customer owes for completed sales plus sales that are still ongoing. The value is the sum of the values in the Money Owed - Current and Money Owed - Expected fields.',
                                    FRB='Spécifie le montant des paiements que le client doit pour les ventes terminées plus les ventes qui sont encore en cours. La valeur correspond à la somme des valeurs dans les champs Montant dû - Actuel et Montant dû - Prévu.',
                                    NLB='Hiermee wordt het betalingsbedrag opgegeven dat de klant verschuldigd is voor voltooide verkopen plus doorlopende verkopen. De waarde is het totaal van de waarden in de velden Geld verschuldigd - Huidig en Geld verschuldigd - Verwacht.';
                    }
                    field(CreditLimit;"Credit Limit (LCY)")
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Credit Limit',
                                    FRB='Crédit autorisé',
                                    NLB='Kredietlimiet';
                        ToolTipML = ENU='Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.',
                                    FRB='Spécifie le montant maximal selon lequel vous autorisez au client à dépasser le solde de paiement avant que des alertes ne soient émises.',
                                    NLB='Hiermee wordt het maximale bedrag opgegeven waarmee de klant het betaalsaldo mag overschrijden voordat waarschuwingen worden verzonden.';
                    }
                    field(CalcCreditLimitLCYExpendedPct;CalcCreditLimitLCYExpendedPct)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Usage Of Credit Limit',
                                    FRB='Utilisation du crédit autorisé',
                                    NLB='Kredietlimietverbruik';
                        ExtendedDatatype = Ratio;
                        Style = Attention;
                        StyleExpr = BalanceExhausted;
                        ToolTipML = ENU='Specifies how much of the customer''s payment balance consists of credit.',
                                    FRB='Spécifie la partie de crédit du solde de paiement du client.',
                                    NLB='Hiermee wordt opgegeven hoeveel van het betaalsaldo van de klant uit credit bestaat.';
                    }
                }
                group(Control108)
                {
                    CaptionML = ENU='Payments',
                                FRB='Paiements',
                                NLB='Betalingen';
                    field("Balance Due";CalcOverdueBalance)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionClass = FORMAT(STRSUBSTNO(OverduePaymentsMsg,FORMAT(WORKDATE)));
                        ToolTipML = ENU='Specifies the sum of outstanding payments from the customer.',
                                    FRB='Spécifie la somme des paiements en attente de la part des clients.',
                                    NLB='Hiermee wordt het totaal opgegeven van openstaande betalingen van de klant.';

                        trigger OnDrillDown();
                        var
                            DtldCustLedgEntry : Record "Detailed Cust. Ledg. Entry";
                            CustLedgEntry : Record "Cust. Ledger Entry";
                        begin
                            DtldCustLedgEntry.SETFILTER("Customer No.","No.");
                            COPYFILTER("Global Dimension 1 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 1");
                            COPYFILTER("Global Dimension 2 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 2");
                            COPYFILTER("Currency Filter",DtldCustLedgEntry."Currency Code");
                            CustLedgEntry.DrillDownOnOverdueEntries(DtldCustLedgEntry);
                        end;
                    }
                    field("Payments (LCY)";"Payments (LCY)")
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Payments This Year',
                                    FRB='Paiements cette année',
                                    NLB='Betalingen dit jaar';
                        ToolTipML = ENU='Specifies the sum of payments received from the customer in the current fiscal year.',
                                    FRB='Spécifie la somme des paiements reçus du client pour l''exercice comptable en cours.',
                                    NLB='Hiermee wordt het totaal opgegeven van betalingen die in het huidige boekjaar van de klant zijn ontvangen.';
                    }
                    field("CustomerMgt.AvgDaysToPay(""No."")";CustomerMgt.AvgDaysToPay("No."))
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Average Collection Period (Days)',
                                    FRB='Délai de règlement moyen (jours)',
                                    NLB='Gemiddelde betalingstermijn (dagen)';
                        DecimalPlaces = 0:1;
                        Importance = Additional;
                        ToolTipML = ENU='Specifies how long the customer typically takes to pay invoices in the current fiscal year.',
                                    FRB='Spécifie combien de temps il faut généralement au client pour payer ses factures au cours de l''exercice comptable actuel.',
                                    NLB='Hiermee wordt opgegeven hoe lang het gemiddeld duurt om facturen te betalen in het huidige boekjaar.';
                    }
                    field(DaysPaidPastDueDate;DaysPastDueDate)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Average Late Payments (Days)',
                                    FRB='Moyenne retard de paiements (jours)',
                                    NLB='Gemiddelde achterstallige betalingen (dagen)';
                        DecimalPlaces = 0:1;
                        Importance = Additional;
                        Style = Attention;
                        StyleExpr = AttentionToPaidDay;
                        ToolTipML = ENU='Specifies the average number of days the customer is late with payments.',
                                    FRB='Spécifie le nombre moyen de jours de retard de paiement du client.',
                                    NLB='Hiermee wordt het gemiddelde aantal dagen opgegeven dat de klant laat is met betalingen.';
                    }
                }
                group("Sales This Year")
                {
                    CaptionML = ENU='Sales This Year',
                                FRB='Ventes cette année',
                                NLB='Omzet dit jaar';
                    field(GetAmountOnPostedInvoices;GetAmountOnPostedInvoices)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionClass = STRSUBSTNO(PostedInvoicesMsg,FORMAT(NoPostedInvoices));
                        ToolTipML = ENU='Specifies your sales to the customer in the current fiscal year based on posted sales invoices. The figure in parenthesis Specifies the number of posted sales invoices.',
                                    FRB='Spécifie vos ventes au client pendant l''exercice comptable en cours en fonction des factures vente enregistrées. Le chiffre entre parenthèses indique le nombre de factures vente enregistrées.',
                                    NLB='Hiermee worden uw verkopen aan de klant in het huidige boekjaar opgegeven op basis van geboekte verkoopfacturen. Het getal tussen haakjes geeft het aantal geboekte verkoopfacturen op.';

                        trigger OnDrillDown();
                        begin
                            CustomerMgt.DrillDownOnPostedInvoices("No.")
                        end;
                    }
                    field(GetAmountOnCrMemo;GetAmountOnCrMemo)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionClass = STRSUBSTNO(CreditMemosMsg,FORMAT(NoPostedCrMemos));
                        ToolTipML = ENU='Specifies your expected refunds to the customer in the current fiscal year based on posted sales credit memos. The figure in parenthesis shows the number of posted sales credit memos.',
                                    FRB='Spécifie vos remboursements prévus au client pendant l''exercice comptable en cours en fonction d''avoirs vente enregistrés. Le chiffre entre parenthèses indique le nombre d''avoirs vente enregistrés.',
                                    NLB='Hiermee worden uw verwachte terugbetalingen aan de klant in het huidige boekjaar opgegeven op basis van geboekte verkoopcreditnota''s. Het getal tussen haakjes geeft het aantal geboekte verkoopcreditnota''s weer.';

                        trigger OnDrillDown();
                        begin
                            CustomerMgt.DrillDownOnPostedCrMemo("No.")
                        end;
                    }
                    field(GetAmountOnOutstandingInvoices;GetAmountOnOutstandingInvoices)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionClass = STRSUBSTNO(OutstandingInvoicesMsg,FORMAT(NoOutstandingInvoices));
                        ToolTipML = ENU='Specifies your expected sales to the customer in the current fiscal year based on ongoing sales invoices. The figure in parenthesis shows the number of ongoing sales invoices.',
                                    FRB='Spécifie vos ventes prévues au client pendant l''exercice comptable en cours en fonction des factures vente en cours. Le chiffre entre parenthèses indique le nombre de factures vente en cours.',
                                    NLB='Hiermee worden uw verwachte verkopen aan de klant in het huidige boekjaar opgegeven op basis van doorlopende verkoopfacturen. Het getal tussen haakjes geeft het aantal doorlopende verkoopfacturen weer.';

                        trigger OnDrillDown();
                        begin
                            CustomerMgt.DrillDownOnUnpostedInvoices("No.")
                        end;
                    }
                    field(GetAmountOnOutstandingCrMemos;GetAmountOnOutstandingCrMemos)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionClass = STRSUBSTNO(OutstandingCrMemosMsg,FORMAT(NoOutstandingCrMemos));
                        ToolTipML = ENU='Specifies your refunds to the customer in the current fiscal year based on ongoing sales credit memos. The figure in parenthesis shows the number of ongoing sales credit memos.',
                                    FRB='Spécifie vos remboursements au client pendant l''exercice comptable en cours en fonction d''avoirs vente en cours. Le chiffre entre parenthèses indique le nombre d''avoirs vente en cours.',
                                    NLB='Hiermee worden uw terugbetalingen aan de klant in het huidige boekjaar opgegeven op basis van doorlopende verkoopcreditnota''s. Het getal tussen haakjes geeft het aantal doorlopende verkoopcreditnota''s weer.';

                        trigger OnDrillDown();
                        begin
                            CustomerMgt.DrillDownOnUnpostedCrMemos("No.")
                        end;
                    }
                    field(Totals;Totals)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Total Sales',
                                    FRB='Total des ventes',
                                    NLB='Totale verkoop';
                        Style = Strong;
                        StyleExpr = TRUE;
                        ToolTipML = ENU='Specifies your total sales turnover with the customer in the current fiscal year. It is calculated from amounts excluding VAT on all completed and open invoices and credit memos.',
                                    FRB='Spécifie votre rotation totale des ventes avec le client au cours de l''exercice comptable en cours. Il est calculé à partir des montants HT sur toutes les factures et avoirs terminés et ouverts.',
                                    NLB='Hiermee wordt uw totale verkoopomzet met de klant in het huidige boekjaar opgegeven. Dit wordt berekend op basis van bedragen exclusief btw van alle voltooide en open facturen en creditnota''s.';
                    }
                    field(CustInvDiscAmountLCY;CustInvDiscAmountLCY)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Invoice Discounts',
                                    FRB='Remises facture',
                                    NLB='Factuurkortingen';
                        ToolTipML = ENU='Specifies the total of all invoice discounts that you have granted to the customer in the current fiscal year.',
                                    FRB='Spécifie le total de toutes les remises facture que vous avez accordées au client pour l''exercice comptable en cours.',
                                    NLB='Hiermee wordt het totaal opgegeven van alle factuurkortingen die u in het huidige boekjaar aan de klant hebt verleend.';
                    }
                }
                part(AgedAccReceivableChart;"Aged Acc. Receivable Chart")
                {
                    ApplicationArea = Advanced;
                    SubPageLink = "No."=FIELD("No.");
                    Visible = ShowCharts;
                }
            }
            part(PriceAndLineDisc;"Sales Price and Line Discounts")
            {
                ApplicationArea = All;
                CaptionML = ENU='Special Prices & Discounts',
                            FRB='Prix et remises spéciaux',
                            NLB='Speciale prijzen en kortingen';
                Visible = FoundationOnly;
            }
        }
        area(factboxes)
        {
            part(Control149;"Customer Picture")
            {
                ApplicationArea = Basic,Suite;
                SubPageLink = "No."=FIELD("No.");
                Visible = NOT IsOfficeAddin;
            }
            part(Details;"Office Customer Details")
            {
                ApplicationArea = All;
                CaptionML = ENU='Details',
                            FRB='Détails',
                            NLB='Details';
                SubPageLink = "No."=FIELD("No.");
                Visible = IsOfficeAddin;
            }
            part(AgedAccReceivableChart2;"Aged Acc. Receivable Chart")
            {
                ApplicationArea = All;
                SubPageLink = "No."=FIELD("No.");
                Visible = IsOfficeAddin;
            }
            part(Control39;"CRM Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No."=FIELD("No.");
                Visible = CRMIsCoupledToRecord;
            }
            part(Control35;"Social Listening FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Source Type"=CONST(Customer),
                              "Source No."=FIELD("No.");
                Visible = SocialListeningVisible;
            }
            part(Control27;"Social Listening Setup FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Source Type"=CONST(Customer),
                              "Source No."=FIELD("No.");
                UpdatePropagation = Both;
                Visible = SocialListeningSetupVisible;
            }
            part(SalesHistSelltoFactBox;"Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic,Suite;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
            }
            part(SalesHistBilltoFactBox;"Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(CustomerStatisticsFactBox;"Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
            }
            part(Control1905532107;"Dimensions FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "Table ID"=CONST(18),
                              "No."=FIELD("No.");
            }
            part(Control1907829707;"Service Hist. Sell-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1902613707;"Service Hist. Bill-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No."=FIELD("No."),
                              "Currency Filter"=FIELD("Currency Filter"),
                              "Date Filter"=FIELD("Date Filter"),
                              "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(WorkflowStatus;"Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207;Links)
            {
            }
            systempart(Control1905767507;Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Customer")
            {
                CaptionML = ENU='&Customer',
                            FRB='&Client',
                            NLB='&Klant';
                Image = Customer;
                action(Dimensions)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Dimensions',
                                FRB='Axes analytiques',
                                NLB='Dimensies';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID"=CONST(18),
                                  "No."=FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTipML = ENU='View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.',
                                FRB='Afficher ou modifier les axes analytiques, tels que la zone, le projet ou le département que vous pouvez affecter aux documents vente et achat afin de distribuer les coûts et analyser l''historique des transactions.',
                                NLB='Dimensies, zoals gebied, project of afdeling, weergeven of bewerken die u kunt toewijzen aan verkoop- en inkoopdocumenten om de kosten te verdelen en de transactiegeschiedenis te analyseren.';
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Bank Accounts',
                                FRB='Comptes bancaires',
                                NLB='Bankrekeningen';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Customer Bank Account List";
                    RunPageLink = "Customer No."=FIELD("No.");
                    ToolTipML = ENU='View or set up the customer''s bank accounts. You can set up any number of bank accounts for each customer.',
                                FRB='Affichez ou configurez les comptes bancaires de votre client. Vous pouvez configurer autant de comptes bancaires que vous le souhaitez pour chaque client.',
                                NLB='Bankrekeningen van de klant weergeven of instellen. U kunt een willekeurig aantal bankrekeningen instellen voor elke klant.';
                }
                action("Direct Debit Mandates")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Direct Debit Mandates',
                                FRB='Mandats de domiciliation européenne',
                                NLB='Mandaten voor Europese domiciliëring';
                    Image = MakeAgreement;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedOnly = true;
                    RunObject = Page "SEPA Direct Debit Mandates";
                    RunPageLink = "Customer No."=FIELD("No.");
                    ToolTipML = ENU='View the direct-debit mandates that reflect agreements with customers to collect invoice payments from their bank account.',
                                FRB='Affichez les mandats de prélèvement que vous définissez afin de refléter les accords passés avec les clients pour le recouvrement des paiements des factures sur leur compte bancaire.',
                                NLB='De incassomachtigingen weergeven die overeenkomen met overeenkomsten met klanten om factuurbetalingen te innen van hun bankrekening.';
                }
                action(ShipToAddresses)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Ship-&to Addresses',
                                FRB='&Adresses destinataire',
                                NLB='Ver&zendadressen';
                    Image = ShipAddress;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Ship-to Address List";
                    RunPageLink = "Customer No."=FIELD("No.");
                    ToolTipML = ENU='View or edit alternate shipping addresses where the customer wants items delivered if different from the regular address.',
                                FRB='Affichez ou modifiez les autres adresses de livraison où le client souhaite faire livrer les articles, si elles sont différentes de l''adresse habituelle.',
                                NLB='Alternatieve verzendadressen weergeven of bewerken waar de klant wil dat artikelen wordt geleverd, als de adressen afwijken van het normale adres.';
                }
                action(Contact)
                {
                    AccessByPermission = TableData Contact=R;
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='C&ontact',
                                FRB='C&ontact',
                                NLB='&Contact';
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTipML = ENU='View or edit detailed information about the contact person at the customer.',
                                FRB='Affichez ou modifiez des informations détaillées concernant la personne à contacter chez le client.',
                                NLB='Gedetailleerde informatie weergeven of bewerken over de contactpersoon bij de klant.';

                    trigger OnAction();
                    begin
                        ShowContact;
                    end;
                }
                action("Cross Re&ferences")
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Cross Re&ferences',
                                FRB='&Références externes',
                                NLB='Kruisver&wijzingen';
                    Image = Change;
                    RunObject = Page "Cross References";
                    RunPageLink = "Cross-Reference Type"=CONST(Customer),
                                  "Cross-Reference Type No."=FIELD("No.");
                    RunPageView = SORTING("Cross-Reference Type","Cross-Reference Type No.");
                    ToolTipML = ENU='Set up the customer''s own identification of items that you sell to the customer. Cross-references to the customer''s item number means that the item number is automatically shown on sales documents instead of the number that you use.',
                                FRB='Configurez la manière dont le client identifie les articles que vous lui vendez. Les références externes au numéro d''article du client impliquent que le numéro d''article est automatiquement affiché sur les documents vente au lieu du numéro que vous utilisez.',
                                NLB='De eigen identificatie van de klant instellen voor artikelen die u aan de klant verkoopt. Kruisverwijzingen naar het artikelnummer van de klant betekenen dat het artikelnummer automatisch op verkoopdocumenten wordt weergegeven in plaats van het nummer dat u gebruikt.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Co&mments',
                                FRB='Co&mmentaires',
                                NLB='Op&merkingen';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name"=CONST(Customer),
                                  "No."=FIELD("No.");
                    ToolTipML = ENU='View or add comments for the record.',
                                FRB='Affichez ou ajoutez des commentaires pour l''enregistrement.',
                                NLB='Opmerkingen weergeven of toevoegen voor de record.';
                }
                action(ApprovalEntries)
                {
                    AccessByPermission = TableData "Approval Entry"=R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Approvals',
                                FRB='Approbations',
                                NLB='Goedkeuringen';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ToolTipML = ENU='View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.',
                                FRB='Affichez une liste des enregistrements en attente d''approbation. Par exemple, vous pouvez voir qui a demandé l''approbation de l''enregistrement, quand il a été envoyé et quand son approbation est due.',
                                NLB='Een lijst weergeven met de records die wachten op goedkeuring. U kunt bijvoorbeeld zien wie goedkeuring van de record heeft aangevraagd, wanneer de record is verzonden en wanneer deze moet worden goedgekeurd.';

                    trigger OnAction();
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                    end;
                }
                action(CustomerReportSelections)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Document Layouts',
                                FRB='Présentations document',
                                NLB='Documentindelingen';
                    Image = Quote;
                    ToolTipML = ENU='Set up a layout for different types of documents such as invoices, quotes, and credit memos.',
                                FRB='Configurez une présentation pour différents types de documents tels que des factures, des devis et avoirs.',
                                NLB='Een lay-out instellen voor verschillende soorten documenten, zoals facturen, offertes en creditnota''s.';

                    trigger OnAction();
                    var
                        CustomReportSelection : Record "Custom Report Selection";
                    begin
                        CustomReportSelection.SETRANGE("Source Type",DATABASE::Customer);
                        CustomReportSelection.SETRANGE("Source No.","No.");
                        PAGE.RUNMODAL(PAGE::"Customer Report Selections",CustomReportSelection);
                    end;
                }
            }
            group(ActionGroupCRM)
            {
                CaptionML = ENU='Dynamics 365 for Sales',
                            FRB='Dynamics 365 for Sales',
                            NLB='Dynamics 365 for Sales';
                Visible = CRMIntegrationEnabled;
                action(CRMGotoAccount)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Account',
                                FRB='Compte',
                                NLB='Account';
                    Image = CoupledCustomer;
                    ToolTipML = ENU='Open the coupled Dynamics 365 for Sales account.',
                                FRB='Ouvrez le compte Dynamics 365 for Sales couplé.',
                                NLB='Het gekoppelde Dynamics 365 for Sales-account openen.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(RECORDID);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record"=IM;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Synchronize',
                                FRB='Synchroniser',
                                NLB='Synchroniseren';
                    Image = Refresh;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTipML = ENU='Send or get updated data to or from Dynamics 365 for Sales.',
                                FRB='Envoyez/recevez des données mises à jour à/de Dynamics 365 for Sales.',
                                NLB='Bijgewerkte gegevens verzenden naar of ophalen uit Dynamics 365 for Sales.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.UpdateOneNow(RECORDID);
                    end;
                }
                action(UpdateStatisticsInCRM)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Update Account Statistics',
                                FRB='Mettre à jour les statistiques compte',
                                NLB='Rekeningstatistiek bijwerken';
                    Enabled = CRMIsCoupledToRecord;
                    Image = UpdateXML;
                    ToolTipML = ENU='Send customer statistics data to Dynamics 365 for Sales to update the Account Statistics FactBox.',
                                FRB='Envoyer les données statistiques client à Dynamics 365 for Sales pour mettre à jour le récapitulatif Statistiques compte.',
                                NLB='Klantstatistiekgegevens verzenden naar Dynamics 365 for Sales om het infoblok Rekeningstatistiek bij te werken.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.CreateOrUpdateCRMAccountStatistics(Rec);
                    end;
                }
                group(Coupling)
                {
                    CaptionML = Comment='Coupling is a noun',
                                ENU='Coupling',
                                FRB='Couplage',
                                NLB='Koppeling';
                    Image = LinkAccount;
                    ToolTipML = ENU='Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Dynamics 365 for Sales record.',
                                FRB='Créez, modifiez ou supprimez un couplage entre l''enregistrement Microsoft Dynamics NAV et un enregistrement Dynamics 365 for Sales.',
                                NLB='Een koppeling tussen de Microsoft Dynamics NAV-record en een Dynamics 365 for Sales-record maken, wijzigen of verwijderen.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record"=IM;
                        ApplicationArea = Suite;
                        CaptionML = ENU='Set Up Coupling',
                                    FRB='Configurer le couplage',
                                    NLB='Koppeling instellen';
                        Image = LinkAccount;
                        Promoted = true;
                        PromotedCategory = Category9;
                        ToolTipML = ENU='Create or modify the coupling to a Dynamics 365 for Sales account.',
                                    FRB='Créez ou modifiez le couplage avec un compte Dynamics 365 for Sales.',
                                    NLB='De koppeling met een Dynamics 365 for Sales-account maken of wijzigen.';
                        Visible = CRMIntegrationEnabled;

                        trigger OnAction();
                        var
                            CRMIntegrationManagement : Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(RECORDID);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record"=IM;
                        ApplicationArea = Suite;
                        CaptionML = ENU='Delete Coupling',
                                    FRB='Supprimer le couplage',
                                    NLB='Koppeling verwijderen';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTipML = ENU='Delete the coupling to a Dynamics 365 for Sales account.',
                                    FRB='Supprimez le couplage avec un compte Dynamics 365 for Sales.',
                                    NLB='De koppeling met een Dynamics 365 for Sales-account verwijderen.';
                        Visible = CRMIntegrationEnabled;

                        trigger OnAction();
                        var
                            CRMCouplingManagement : Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(RECORDID);
                        end;
                    }
                }
                action(ShowLog)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Synchronization Log',
                                FRB='Journal de synchronisation',
                                NLB='Synchronisatielogbestand';
                    Image = Log;
                    ToolTipML = ENU='View integration synchronization jobs for the customer table.',
                                FRB='Affichez les projets de synchronisation d''intégration pour la table Client.',
                                NLB='Synchronisatietaken voor integratie voor de klanttabel weergeven.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(RECORDID);
                    end;
                }
            }
            group(History)
            {
                CaptionML = ENU='History',
                            FRB='Historique',
                            NLB='Historiek';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Ledger E&ntries',
                                FRB='É&critures comptables',
                                NLB='Poste&n';
                    Image = CustomerLedger;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Customer No.")
                                  ORDER(Descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTipML = ENU='View the history of transactions that have been posted for the selected record.',
                                FRB='Affichez l''historique des transactions qui ont été validées pour l''enregistrement sélectionné.',
                                NLB='De historiek weergeven van transacties die zijn geboekt voor de geselecteerde record.';
                }
                action(Statistics)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Statistics',
                                FRB='Statistiques',
                                NLB='Statistiek';
                    Image = Statistics;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Customer Statistics";
                    RunPageLink = "No."=FIELD("No."),
                                  "Date Filter"=FIELD("Date Filter"),
                                  "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                    ToolTipML = ENU='View statistical information, such as the value of posted entries, for the record.',
                                FRB='Afficher les informations statistiques telles que la valeur des écritures validées pour l''enregistrement.',
                                NLB='Statistische informatie, zoals de waarde van geboekte posten, voor de record weergeven.';
                }
                action("S&ales")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='S&ales',
                                FRB='&Ventes',
                                NLB='V&erkoop';
                    Image = Sales;
                    RunObject = Page "Customer Sales";
                    RunPageLink = "No."=FIELD("No."),
                                  "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                    ToolTipML = ENU='View a summary of customer ledger entries. You select the time interval in the View by field. The Period column on the left contains a series of dates that are determined by the time interval you have selected.',
                                FRB='Afficher un récapitulatif des écritures comptables client. Sélectionnez l''intervalle de temps dans le champ Afficher par. La colonne Début période située à gauche affiche une série de dates qui sont déterminées par l''intervalle de temps que vous avez sélectionné.',
                                NLB='Een overzicht van klantposten weergeven. U selecteert het tijdsinterval in het veld Weergeven per. De kolom Periode aan de linkerkant bevat een datumreeks die wordt bepaald door het geselecteerde tijdsinterval.';
                }
                action("Entry Statistics")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Entry Statistics',
                                FRB='Statistiques écritures',
                                NLB='Boekingsstatistiek';
                    Image = EntryStatistics;
                    RunObject = Page "Customer Entry Statistics";
                    RunPageLink = "No."=FIELD("No."),
                                  "Date Filter"=FIELD("Date Filter"),
                                  "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter");
                    ToolTipML = ENU='View entry statistics for the record.',
                                FRB='Afficher les statistiques écritures de l''enregistrement.',
                                NLB='Postenstatistieken voor de record weergeven.';
                }
                action("Statistics by C&urrencies")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Statistics by C&urrencies',
                                FRB='Statistiques par &devise',
                                NLB='Statistiek per &valuta';
                    Image = Currencies;
                    RunObject = Page "Cust. Stats. by Curr. Lines";
                    RunPageLink = "Customer Filter"=FIELD("No."),
                                  "Global Dimension 1 Filter"=FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter"=FIELD("Global Dimension 2 Filter"),
                                  "Date Filter"=FIELD("Date Filter");
                    ToolTipML = ENU='View statistics for customers that use multiple currencies.',
                                FRB='Afficher les statistiques pour les clients qui utilisent plusieurs devises.',
                                NLB='Statistieken weergeven voor klanten die meerdere valuta''s gebruiken.';
                }
                action("Item &Tracking Entries")
                {
                    ApplicationArea = ItemTracking;
                    CaptionML = ENU='Item &Tracking Entries',
                                FRB='&Ecritures traçabilité',
                                NLB='Ar&tikeltraceringsposten';
                    Image = ItemTrackingLedger;
                    ToolTipML = ENU='View serial or lot numbers that are assigned to items.',
                                FRB='Afficher les numéros de série et de lot qui sont affectés aux articles.',
                                NLB='Serie- of lotnummers weergeven die zijn toegewezen aan artikelen.';

                    trigger OnAction();
                    var
                        ItemTrackingDocMgt : Codeunit "Item Tracking Doc. Management";
                    begin
                        ItemTrackingDocMgt.ShowItemTrackingForMasterData(1,"No.",'','','','','');
                    end;
                }
                separator(Separator140)
                {
                }
            }
            group("Prices and Discounts")
            {
                CaptionML = ENU='Prices and Discounts',
                            FRB='Prix et remises',
                            NLB='Prijzen en kortingen';
                action("Invoice &Discounts")
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Invoice &Discounts',
                                FRB='Remises &facture',
                                NLB='&Factuurkorting';
                    Image = CalculateInvoiceDiscount;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    RunObject = Page "Cust. Invoice Discounts";
                    RunPageLink = Code=FIELD("Invoice Disc. Code");
                    ToolTipML = ENU='Set up different discounts that are applied to invoices for the customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.',
                                FRB='Configurez des remises différentes qui seront appliquées aux factures client. Une remise facture est automatiquement accordée au client lorsque le total sur la facture vente dépasse un certain montant.',
                                NLB='Verschillende kortingen instellen die worden toegepast op facturen voor de klant. Er wordt automatisch een factuurkorting aan de klant verleend wanneer het totaal van een verkoopfactuur boven een bepaald bedrag komt.';
                }
                action(Prices)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Prices',
                                FRB='Prix',
                                NLB='Prijzen';
                    Image = Price;
                    RunObject = Page "Sales Prices";
                    RunPageLink = "Sales Type"=CONST(Customer),
                                  "Sales Code"=FIELD("No.");
                    RunPageView = SORTING("Sales Type","Sales Code");
                    ToolTipML = ENU='View or set up different prices for items that you sell to the customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.',
                                FRB='Affichez ou paramétrez des prix différents pour les articles que vous vendez au client. Un prix article est automatiquement affecté sur les lignes facture lorsque les critères spécifiés sont satisfaits, par exemple le client, la quantité ou la date de fin.',
                                NLB='Andere prijzen weergeven of instellen voor artikelen die u aan de klant verkoopt. Er wordt automatisch een artikelprijs op factuurregels gehanteerd als aan de opgegeven criteria wordt voldaan, zoals klant, aantal of einddatum.';
                }
                action("Line Discounts")
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Line Discounts',
                                FRB='Remises ligne',
                                NLB='Regelkortingen';
                    Image = LineDiscount;
                    RunObject = Page "Sales Line Discounts";
                    RunPageLink = "Sales Type"=CONST(Customer),
                                  "Sales Code"=FIELD("No.");
                    RunPageView = SORTING("Sales Type","Sales Code");
                    ToolTipML = ENU='View or set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.',
                                FRB='Afficher ou définissez des remises différentes pour les articles que vous vendez au client. Une remise article est automatiquement affectée sur les lignes facture lorsque les critères spécifiés sont satisfaits, par exemple le client, la quantité ou la date de fin.',
                                NLB='Andere kortingen instellen of weergeven voor artikelen die u aan de klant verkoopt. Er wordt automatisch een artikelkorting aan factuurregels toegekend als aan de opgegeven criteria wordt voldaan, zoals klant, aantal of einddatum.';
                }
            }
            group(ActionGroup82)
            {
                CaptionML = ENU='S&ales',
                            FRB='&Ventes',
                            NLB='V&erkoop';
                Image = Sales;
                action("Prepa&yment Percentages")
                {
                    ApplicationArea = Prepayments;
                    CaptionML = ENU='Prepa&yment Percentages',
                                FRB='Pourcentages acom&pte',
                                NLB='&Vooruitbetalingspercentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Sales Type"=CONST(Customer),
                                  "Sales Code"=FIELD("No.");
                    RunPageView = SORTING("Sales Type","Sales Code");
                    ToolTipML = ENU='View or edit the percentages of the price that can be paid as a prepayment. ',
                                FRB='Afficher ou modifier les pourcentages du prix pouvant être réglés comme un acompte. ',
                                NLB='De percentages van de prijs weergeven of bewerken die als een vooruitbetaling kunnen worden betaald. ';
                }
                action("Recurring Sales Lines")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Recurring Sales Lines',
                                FRB='Lignes vente récurrentes',
                                NLB='Periodieke verkoopregels';
                    Ellipsis = true;
                    Image = CustomerCode;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Standard Customer Sales Codes";
                    RunPageLink = "Customer No."=FIELD("No.");
                    ToolTipML = ENU='Set up recurring sales lines for the customer, such as a monthly replenishment order, that can quickly be inserted on a sales document for the customer.',
                                FRB='Définissez des lignes vente récurrentes pour le client, par exemple un ordre de réapprovisionnement mensuel, qui peuvent être rapidement insérées dans un document vente pour le client.',
                                NLB='Periodieke verkoopregels voor de klant instellen, zoals een maandelijkse aanvullingsorder, die eenvoudig in een verkoopdocument voor de klant kunnen worden ingevoegd.';
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRB='Documents',
                            NLB='Documenten';
                Image = Documents;
                action(Quotes)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Quotes',
                                FRB='Devis',
                                NLB='Offertes';
                    Image = Quote;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Document Type","Sell-to Customer No.");
                    ToolTipML = ENU='View a list of ongoing sales quotes for the customer.',
                                FRB='Affichez une liste des devis vente en cours pour le client.',
                                NLB='Een lijst met lopende verkoopoffertes voor de klant weergeven.';
                }
                action(Invoices)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Invoices',
                                FRB='Factures',
                                NLB='Facturen';
                    Image = Invoice;
                    RunObject = Page "Sales Invoice List";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Document Type","Sell-to Customer No.");
                    ToolTipML = ENU='View a list of ongoing sales invoices for the customer.',
                                FRB='Affichez la liste des factures vente en cours pour le client.',
                                NLB='Een lijst weergeven met lopende verkoopfacturen voor de klant.';
                }
                action(Orders)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Orders',
                                FRB='Commandes',
                                NLB='Orders';
                    Image = Document;
                    RunObject = Page "Sales Order List";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Document Type","Sell-to Customer No.");
                    ToolTipML = ENU='View a list of ongoing sales orders for the customer.',
                                FRB='Afficher la liste des commandes vente en cours pour le client.',
                                NLB='Een lijst met lopende verkooporders voor de klant weergeven.';
                }
                action("Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    CaptionML = ENU='Return Orders',
                                FRB='Retours',
                                NLB='Retourorders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Order List";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Document Type","Sell-to Customer No.");
                    ToolTipML = ENU='Open the list of ongoing return orders.',
                                FRB='Ouvrir la liste des retours en cours.',
                                NLB='De lijst met lopende retourorders openen.';
                }
                group("Issued Documents")
                {
                    CaptionML = ENU='Issued Documents',
                                FRB='Documents émis',
                                NLB='Verzonden documenten';
                    Image = Documents;
                    action("Issued &Reminders")
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Issued &Reminders',
                                    FRB='&Relances émises',
                                    NLB='Verzonden &aanmaningen';
                        Image = OrderReminder;
                        RunObject = Page "Issued Reminder List";
                        RunPageLink = "Customer No."=FIELD("No.");
                        RunPageView = SORTING("Customer No.","Posting Date");
                        ToolTipML = ENU='View the reminders that you have sent to the customer.',
                                    FRB='Affichez les rappels que vous avez envoyés au client.',
                                    NLB='De aanmaningen weergeven die u naar de klant hebt verzonden.';
                    }
                    action("Issued &Finance Charge Memos")
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Issued &Finance Charge Memos',
                                    FRB='Fact&ures d''intérêts émises',
                                    NLB='Verzonden &rentefacturen';
                        Image = FinChargeMemo;
                        RunObject = Page "Issued Fin. Charge Memo List";
                        RunPageLink = "Customer No."=FIELD("No.");
                        RunPageView = SORTING("Customer No.","Posting Date");
                        ToolTipML = ENU='View the finance charge memos that you have sent to the customer.',
                                    FRB='Affichez les factures d''intérêts que vous avez envoyées au client.',
                                    NLB='De rentefacturen weergeven die u naar de klant hebt verzonden.';
                    }
                }
                action("Blanket Orders")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Blanket Orders',
                                FRB='Commandes ouvertes',
                                NLB='Raamcontracten';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Sales Orders";
                    RunPageLink = "Sell-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Document Type","Sell-to Customer No.");
                    ToolTipML = ENU='Open the list of ongoing blanket orders.',
                                FRB='Ouvrir la liste des commandes ouvertes en cours.',
                                NLB='De lijst met lopende raamcontracten openen.';
                }
                action("&Jobs")
                {
                    ApplicationArea = Jobs;
                    CaptionML = ENU='&Jobs',
                                FRB='&Projets',
                                NLB='&Projecten';
                    Image = Job;
                    RunObject = Page "Job List";
                    RunPageLink = "Bill-to Customer No."=FIELD("No.");
                    RunPageView = SORTING("Bill-to Customer No.");
                    ToolTipML = ENU='Open the list of ongoing jobs.',
                                FRB='Ouvrir la liste des projets en cours.',
                                NLB='De lijst met lopende projecten openen.';
                }
            }
            group(Service)
            {
                CaptionML = ENU='Service',
                            FRB='Service',
                            NLB='Service';
                Image = ServiceItem;
                action("Service Orders")
                {
                    ApplicationArea = Service;
                    CaptionML = ENU='Service Orders',
                                FRB='Commandes service',
                                NLB='Serviceorders';
                    Image = Document;
                    RunObject = Page "Service Orders";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Document Type","Customer No.");
                    ToolTipML = ENU='Open the list of ongoing service orders.',
                                FRB='Ouvrir la liste des commandes service en cours.',
                                NLB='De lijst met lopende serviceorders openen.';
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Service;
                    CaptionML = ENU='Ser&vice Contracts',
                                FRB='Co&ntrats de service',
                                NLB='Servicec&ontracten';
                    Image = ServiceAgreement;
                    RunObject = Page "Customer Service Contracts";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Customer No.","Ship-to Code");
                    ToolTipML = ENU='Open the list of ongoing service contracts.',
                                FRB='Ouvrir la liste des contrats de service en cours.',
                                NLB='De lijst met lopende servicecontracten openen.';
                }
                action("Service &Items")
                {
                    ApplicationArea = Service;
                    CaptionML = ENU='Service &Items',
                                FRB='Ar&ticles de service',
                                NLB='Serviceart&ikelen';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                    RunPageLink = "Customer No."=FIELD("No.");
                    RunPageView = SORTING("Customer No.","Ship-to Code","Item No.","Serial No.");
                    ToolTipML = ENU='View or edit the service items that are registered for the customer.',
                                FRB='Afficher ou modifier les articles de service qui sont enregistrés pour le client.',
                                NLB='De serviceartikelen weergeven of bewerken die voor de klant zijn geregistreerd.';
                }
            }
        }
        area(creation)
        {
            action(NewBlanketSalesOrder)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Advanced;
                CaptionML = ENU='Blanket Sales Order',
                            FRB='Commande ouverte vente',
                            NLB='Verkoopraamcontract';
                Image = BlanketOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Blanket Sales Order";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a blanket sales order for the customer.',
                            FRB='Créez une commande ouverte vente pour le client.',
                            NLB='Een verkoopraamcontract voor de klant maken.';
            }
            action(NewSalesQuote)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Quote',
                            FRB='Devis',
                            NLB='Verk.-offerte';
                Image = NewSalesQuote;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                RunObject = Page "Sales Quote";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Offer items or services to a customer.',
                            FRB='Proposer des articles ou des services à un client.',
                            NLB='Artikelen of services aanbieden aan een klant.';
                Visible = NOT IsOfficeAddin;
            }
            action(NewSalesInvoice)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Invoice',
                            FRB='Facture vente',
                            NLB='Verk.-factuur';
                Image = NewSalesInvoice;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                RunObject = Page "Sales Invoice";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a sales invoice for the customer.',
                            FRB='Créez une facture vente pour le client.',
                            NLB='Een verkoopfactuur voor de klant maken.';
                Visible = NOT IsOfficeAddin;
            }
            action(NewSalesOrder)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Order',
                            FRB='Commande vente',
                            NLB='Verkooporder';
                Image = Document;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                RunObject = Page "Sales Order";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a sales order for the customer.',
                            FRB='Créez une commande vente pour le client.',
                            NLB='Een verkooporder voor de klant maken.';
                Visible = NOT IsOfficeAddin;
            }
            action(NewSalesCreditMemo)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Credit Memo',
                            FRB='Avoir vente',
                            NLB='Verk.-creditnota';
                Image = CreditMemo;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                RunObject = Page "Sales Credit Memo";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new sales credit memo to revert a posted sales invoice.',
                            FRB='Créez un avoir vente pour annuler une facture vente validée.',
                            NLB='Een nieuwe verkoopcreditnota maken om een geboekte verkoopfactuur terug te draaien.';
                Visible = NOT IsOfficeAddin;
            }
            action(NewSalesQuoteAddin)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Quote',
                            FRB='Devis',
                            NLB='Verkoopofferte';
                Image = NewSalesQuote;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                ToolTipML = ENU='Offer items or services to a customer.',
                            FRB='Proposer des articles ou des services à un client.',
                            NLB='Artikelen of services aanbieden aan een klant.';
                Visible = IsOfficeAddin;

                trigger OnAction();
                begin
                    CreateAndShowNewQuote;
                end;
            }
            action(NewSalesInvoiceAddin)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Invoice',
                            FRB='Facture vente',
                            NLB='Verkoopfactuur';
                Image = NewSalesInvoice;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                ToolTipML = ENU='Create a sales invoice for the customer.',
                            FRB='Créez une facture vente pour le client.',
                            NLB='Een verkoopfactuur voor de klant maken.';
                Visible = IsOfficeAddin;

                trigger OnAction();
                begin
                    CreateAndShowNewInvoice;
                end;
            }
            action(NewSalesOrderAddin)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Order',
                            FRB='Commande vente',
                            NLB='Verkooporder';
                Image = Document;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                ToolTipML = ENU='Create a sales order for the customer.',
                            FRB='Créer une commande vente pour le client.',
                            NLB='Een verkooporder voor de klant maken.';
                Visible = IsOfficeAddin;

                trigger OnAction();
                begin
                    CreateAndShowNewOrder;
                end;
            }
            action(NewSalesCreditMemoAddin)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Sales Credit Memo',
                            FRB='Avoir vente',
                            NLB='Verkoopcreditnota';
                Image = CreditMemo;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedOnly = true;
                ToolTipML = ENU='Create a new sales credit memo to revert a posted sales invoice.',
                            FRB='Créer un avoir vente pour annuler une facture vente validée.',
                            NLB='Een nieuwe verkoopcreditnota maken om een geboekte verkoopfactuur terug te draaien.';
                Visible = IsOfficeAddin;

                trigger OnAction();
                begin
                    CreateAndShowNewCreditMemo;
                end;
            }
            action(NewSalesReturnOrder)
            {
                AccessByPermission = TableData "Sales Header"=RIM;
                ApplicationArea = Advanced;
                CaptionML = ENU='Sales Return Order',
                            FRB='Retour vente',
                            NLB='Verkoopretourorder';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Sales Return Order";
                RunPageLink = "Sell-to Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new sales return order for items or services.',
                            FRB='Créer un retour vente pour les articles ou les services.',
                            NLB='Een nieuwe verkoopretourorder maken voor artikelen of services.';
            }
            action(NewServiceQuote)
            {
                AccessByPermission = TableData "Service Header"=RIM;
                ApplicationArea = Service;
                CaptionML = ENU='Service Quote',
                            FRB='Devis service',
                            NLB='Serviceofferte';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Service Quote";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new service quote for the customer.',
                            FRB='Créer un devis service pour le client.',
                            NLB='Een nieuwe serviceofferte voor de klant maken.';
            }
            action(NewServiceInvoice)
            {
                AccessByPermission = TableData "Service Header"=RIM;
                ApplicationArea = Service;
                CaptionML = ENU='Service Invoice',
                            FRB='Facture service',
                            NLB='Servicefactuur';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Service Invoice";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new service invoice for the customer.',
                            FRB='Créer une facture service pour le client.',
                            NLB='Een nieuwe servicefactuur voor de klant maken.';
            }
            action(NewServiceOrder)
            {
                AccessByPermission = TableData "Service Header"=RIM;
                ApplicationArea = Service;
                CaptionML = ENU='Service Order',
                            FRB='Commande service',
                            NLB='Serviceorder';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Service Order";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new service order for the customer.',
                            FRB='Créer une commande service pour le client.',
                            NLB='Een nieuwe serviceorder voor de klant maken.';
            }
            action(NewServiceCreditMemo)
            {
                AccessByPermission = TableData "Service Header"=RIM;
                ApplicationArea = Service;
                CaptionML = ENU='Service Credit Memo',
                            FRB='Avoir service',
                            NLB='Servicecreditnota';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Service Credit Memo";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new service credit memo for the customer.',
                            FRB='Créer un avoir service pour le client.',
                            NLB='Een nieuwe servicecreditnota voor de klant maken.';
            }
            action(NewReminder)
            {
                AccessByPermission = TableData "Reminder Header"=RIM;
                ApplicationArea = Advanced;
                CaptionML = ENU='Reminder',
                            FRB='Relance',
                            NLB='Aanmaning';
                Image = Reminder;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page Reminder;
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new reminder for the customer.',
                            FRB='Créer une relance pour le client.',
                            NLB='Een nieuwe aanmaning voor de klant maken.';
            }
            action(NewFinanceChargeMemo)
            {
                AccessByPermission = TableData "Finance Charge Memo Header"=RIM;
                ApplicationArea = Advanced;
                CaptionML = ENU='Finance Charge Memo',
                            FRB='Facture d''intérêts',
                            NLB='Rentefactuur';
                Image = FinChargeMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                RunObject = Page "Finance Charge Memo";
                RunPageLink = "Customer No."=FIELD("No.");
                RunPageMode = Create;
                ToolTipML = ENU='Create a new finance charge memo.',
                            FRB='Créer une facture d''intérêts.',
                            NLB='Een nieuwe rentefactuur maken.';
            }
        }
        area(processing)
        {
            group(Approval)
            {
                CaptionML = ENU='Approval',
                            FRB='Approbation',
                            NLB='Goedkeuring';
                Visible = OpenApprovalEntriesExistCurrUser;
                action(Approve)
                {
                    ApplicationArea = All;
                    CaptionML = ENU='Approve',
                                FRB='Approuver',
                                NLB='Goedkeuren';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTipML = ENU='Approve the requested changes.',
                                FRB='Approuvez les modifications requises.',
                                NLB='De aangevraagde wijzigingen goedkeuren.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    CaptionML = ENU='Reject',
                                FRB='Rejeter',
                                NLB='Weigeren';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTipML = ENU='Reject the approval request.',
                                FRB='Rejetez la demande d''approbation.',
                                NLB='De goedkeuringsaanvraag weigeren.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    CaptionML = ENU='Delegate',
                                FRB='Déléguer',
                                NLB='Delegeren';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTipML = ENU='Delegate the approval to a substitute approver.',
                                FRB='Déléguez l''approbation à un approbateur remplaçant.',
                                NLB='De goedkeuring delegeren naar een vervangende beoordelaar.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    CaptionML = ENU='Comments',
                                FRB='Commentaires',
                                NLB='Opmerkingen';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTipML = ENU='View or add comments for the record.',
                                FRB='Afficher ou ajouter des commentaires pour l''enregistrement.',
                                NLB='Opmerkingen weergeven of toevoegen voor de record.';
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRB='Approbation demande achat',
                            NLB='Goedkeuring aanvragen';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Send A&pproval Request',
                                FRB='Envoyer demande d''a&pprobation',
                                NLB='G&oedkeuringsaanvraag verzenden';
                    Enabled = (NOT OpenApprovalEntriesExist) AND EnabledApprovalWorkflowsExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ToolTipML = ENU='Request approval to change the record.',
                                FRB='Demander l''approbation pour modifier l''enregistrement.',
                                NLB='Goedkeuring aanvragen om de record te wijzigen.';

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.CheckCustomerApprovalsWorkflowEnabled(Rec) then
                          ApprovalsMgmt.OnSendCustomerForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Cancel Approval Re&quest',
                                FRB='Annuler demande d''appro&bation',
                                NLB='&Goedkeuringsaanvraag annuleren';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ToolTipML = ENU='Cancel the approval request.',
                                FRB='Annulez la demande d''approbation.',
                                NLB='De goedkeuringsaanvraag annuleren.';

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
                        WorkflowWebhookManagement : Codeunit "Workflow Webhook Management";
                    begin
                        ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);
                        WorkflowWebhookManagement.FindAndCancel(RECORDID);
                    end;
                }
                group(Flow)
                {
                    CaptionML = ENU='Flow',
                                FRB='Flow',
                                NLB='Flow';
                    action(CreateFlow)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Create a Flow',
                                    FRB='Créer un flux de travail',
                                    NLB='Een werkstroom maken';
                        Image = Flow;
                        Promoted = true;
                        PromotedCategory = Category6;
                        PromotedOnly = true;
                        ToolTipML = ENU='Create a new Flow from a list of relevant Flow templates.',
                                    FRB='Créez un flux de travail à partir d''une liste de modèles de flux de travail appropriés.',
                                    NLB='Een nieuwe werkstroom maken vanuit een lijst met relevante werkstroomsjablonen.';
                        Visible = IsSaaS;

                        trigger OnAction();
                        var
                            FlowServiceManagement : Codeunit "Flow Service Management";
                            FlowTemplateSelector : Page "Flow Template Selector";
                        begin
                            // Opens page 6400 where the user can use filtered templates to create new flows.
                            FlowTemplateSelector.SetSearchText(FlowServiceManagement.GetCustomerTemplateFilter);
                            FlowTemplateSelector.RUN;
                        end;
                    }
                    action(SeeFlows)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='See my Flows',
                                    FRB='Afficher mes flux de travail',
                                    NLB='Mijn werkstromen weergeven';
                        Image = Flow;
                        Promoted = true;
                        PromotedCategory = Category6;
                        PromotedOnly = true;
                        RunObject = Page "Flow Selector";
                        ToolTipML = ENU='View and configure Flows that you created.',
                                    FRB='Affichez et configurez les flux de travail créés.',
                                    NLB='Werkstromen weergeven en configureren die u hebt gemaakt.';
                    }
                }
            }
            group(Workflow)
            {
                CaptionML = ENU='Workflow',
                            FRB='Flux de travail',
                            NLB='Werkstroom';
                action(CreateApprovalWorkflow)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Create Approval Workflow',
                                FRB='Créer flux de travail approbation',
                                NLB='Goedkeuringswerkstroom maken';
                    Enabled = NOT EnabledApprovalWorkflowsExist;
                    Image = CreateWorkflow;
                    ToolTipML = ENU='Set up an approval workflow for creating or changing customers, by going through a few pages that will guide you.',
                                FRB='Configurez un flux de travail approbation pour créer ou modifier des clients, en consultant quelques pages qui vous guideront.',
                                NLB='Een goedkeuringswerkstroom voor het maken of wijzigen van klanten instellen door enkele pagina''s te doorlopen die u begeleiden.';

                    trigger OnAction();
                    begin
                        PAGE.RUNMODAL(PAGE::"Cust. Approval WF Setup Wizard");
                    end;
                }
                action(ManageApprovalWorkflows)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Manage Approval Workflows',
                                FRB='Gérer les flux de travail approbation',
                                NLB='Goedkeuringswerkstromen beheren';
                    Enabled = EnabledApprovalWorkflowsExist;
                    Image = WorkflowSetup;
                    ToolTipML = ENU='View or edit existing approval workflows for creating or changing customers.',
                                FRB='Affichez ou modifiez des flux de travail approbation existants pour créer ou modifier des clients.',
                                NLB='Bestaande goedkeuringswerkstromen voor het maken of wijzigen van klanten weergeven of bewerken.';

                    trigger OnAction();
                    var
                        WorkflowManagement : Codeunit "Workflow Management";
                    begin
                        WorkflowManagement.NavigateToWorkflows(DATABASE::Customer,EventFilter);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRB='Fonction&s',
                            NLB='F&uncties';
                Image = "Action";
                action(Templates)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Templates',
                                FRB='Modèles',
                                NLB='Sjablonen';
                    Image = Template;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Config Templates";
                    RunPageLink = "Table ID"=CONST(18);
                    ToolTipML = ENU='View or edit customer templates.',
                                FRB='Affichez ou modifiez des modèles client.',
                                NLB='Klantensjablonen weergeven of bewerken.';
                }
                action(ApplyTemplate)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Apply Template',
                                FRB='Appliquer modèle',
                                NLB='Sjabloon toepassen';
                    Ellipsis = true;
                    Image = ApplyTemplate;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTipML = ENU='Apply a template to update the entity with your standard settings for a certain type of entity.',
                                FRB='Appliquez un modèle pour mettre à jour l''entité avec vos paramètres standard pour un certain type d''entité.',
                                NLB='Een sjabloon toepassen om de entiteit bij te werken met uw standaardinstellingen voor een bepaald type entiteit.';

                    trigger OnAction();
                    var
                        MiniCustomerTemplate : Record "Mini Customer Template";
                    begin
                        MiniCustomerTemplate.UpdateCustomerFromTemplate(Rec);
                    end;
                }
                action(SaveAsTemplate)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Save as Template',
                                FRB='Sauvegarder comme modèle',
                                NLB='Opslaan als sjabloon';
                    Ellipsis = true;
                    Image = Save;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    ToolTipML = ENU='Save the customer card as a template that can be reused to create new customer cards. Customer templates contain preset information to help you fill fields on customer cards.',
                                FRB='Enregistrez la fiche client comme modèle que vous pourrez réutiliser pour créer de nouvelles fiches client. Les modèles client contiennent des informations prédéfinies pour vous aider à compléter les fiches client.',
                                NLB='De klantenkaart opslaan als sjabloon die opnieuw kan worden gebruikt om nieuwe klantenkaarten te maken. Klantensjablonen bevatten vooraf ingevulde informatie en helpen u bij het invullen van velden op klantenkaarten.';

                    trigger OnAction();
                    var
                        TempMiniCustomerTemplate : Record "Mini Customer Template" temporary;
                    begin
                        TempMiniCustomerTemplate.SaveAsTemplate(Rec);
                    end;
                }
            }
            action("Post Cash Receipts")
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='Post Cash Receipts',
                            FRB='Reporter règlements',
                            NLB='Kasontvangsten boeken';
                Ellipsis = true;
                Image = CashReceiptJournal;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Cash Receipt Journal";
                ToolTipML = ENU='Create a cash receipt journal line for the customer, for example, to post a payment receipt.',
                            FRB='Créez une ligne feuille règlement pour le client, par exemple, pour valider un reçu de paiement.',
                            NLB='Een ontvangstendagboekregel maken voor de klant, bijvoorbeeld om een betalingsontvangst te boeken.';
            }
            action("Sales Journal")
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='Sales Journal',
                            FRB='Feuille vente',
                            NLB='Verkoopdagboek';
                Image = Journals;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Journal";
                ToolTipML = ENU='Post any sales transaction for the customer.',
                            FRB='Valider les transactions de vente pour le client.',
                            NLB='Verkooptransacties boeken voor de klant.';
            }
        }
        area(reporting)
        {
            action("Report Customer Detailed Aging")
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Customer Detailed Aging',
                            FRB='Écritures client ouvertes',
                            NLB='Klant - Vervallen posten';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTipML = ENU='View a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.',
                            FRB='Affichez une liste détaillée des totaux dus de chaque client, divisée en trois périodes. Cet état sert à décider quand émettre des relances, à évaluer la solvabilité d''un client ou à préparer des analyses de liquidités.',
                            NLB='Een gedetailleerde, in drie perioden verdeelde lijst met het totaal aan openstaande betalingen van elke klant weergeven. Het rapport kan worden gebruikt om te besluiten wanneer er aanmaningen moeten worden verzonden, om de kredietwaardigheid van een klant te evalueren of om liquiditeitsanalyses voor te bereiden.';

                trigger OnAction();
                begin
                    RunReport(REPORT::"Customer Detailed Aging","No.");
                end;
            }
            action("Report Customer - Labels")
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='Customer - Labels',
                            FRB='Clients : Étiquettes',
                            NLB='Klant - Etiketten';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category9;
                ToolTipML = ENU='View mailing labels with the customers'' names and addresses.',
                            FRB='Affichez des étiquettes de routage comportant le nom et l''adresse des clients.',
                            NLB='Etiketten met de naam en het adres van klanten weergeven.';

                trigger OnAction();
                begin
                    RunReport(REPORT::"Customer - Labels","No.");
                end;
            }
            action("Report Customer - Balance to Date")
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Customer - Balance to Date',
                            FRB='Clients : Écritures ouvertes',
                            NLB='Klant - Saldo t/m datum';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category9;
                ToolTipML = ENU='View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.',
                            FRB='Affichez une liste reprenant l''historique des paiements des clients jusqu''à une certaine date. Vous pouvez utiliser l''état pour extraire vos revenus de vente totaux à la clôture d''une période comptable ou d''un exercice.',
                            NLB='Een lijst met de betalingshistoriek van klanten tot een bepaalde datum weergeven. U kunt het rapport gebruiken om er bij de afsluiting van een boekingsperiode of boekjaar uw totale omzet uit te extraheren.';

                trigger OnAction();
                begin
                    RunReport(REPORT::"Customer - Balance to Date","No.");
                end;
            }
            action("Report Statement")
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='Statement',
                            FRB='Relevé',
                            NLB='Rekeningoverzicht';
                Image = "Report";
                RunObject = Codeunit "Customer Layout - Statement";
                ToolTipML = ENU='View a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.',
                            FRB='Affichez une liste des transactions d''un client pour une période sélectionnée, par exemple, à envoyer au client à la clôture d''une période comptable. Vous pouvez choisir d''afficher tous les soldes échus, sans tenir compte de la période spécifiée, ou d''inclure un cumul date.',
                            NLB='Een lijst met transacties van een klant in een bepaalde periode weergeven. Deze lijst kan dan bijvoorbeeld aan het eind van een boekingsperiode naar de klant worden verzonden. U kunt alle openstaande saldi weergeven, ongeacht de opgegeven periode, of u kunt ervoor kiezen een vervaldatuminterval op te nemen.';
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        CRMCouplingManagement : Codeunit "CRM Coupling Management";
        WorkflowManagement : Codeunit "Workflow Management";
        WorkflowEventHandling : Codeunit "Workflow Event Handling";
        WorkflowWebhookManagement : Codeunit "Workflow Webhook Management";
    begin
        CreateCustomerFromTemplate;
        ActivateFields;
        StyleTxt := SetStyle;
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
        if CRMIntegrationEnabled then begin
          CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID);
          if "No." <> xRec."No." then
            CRMIntegrationManagement.SendResultNotification(Rec);
        end;
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);

        if FoundationOnly then
          GetSalesPricesAndSalesLineDisc;

        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);

        EventFilter := WorkflowEventHandling.RunWorkflowOnSendCustomerForApprovalCode + '|' +
          WorkflowEventHandling.RunWorkflowOnCustomerChangedCode;

        EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::Customer,EventFilter);

        WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);

        if "No." <> '' then begin
          if ShowCharts then
            CurrPage.AgedAccReceivableChart.PAGE.UpdateChartForCustomer("No.");
          if IsOfficeAddin then
            CurrPage.AgedAccReceivableChart2.PAGE.UpdateChartForCustomer("No.");
        end;
    end;

    trigger OnAfterGetRecord();
    var
        AgedAccReceivable : Codeunit "Aged Acc. Receivable";
    begin
        ActivateFields;
        StyleTxt := SetStyle;
        BalanceExhausted := 10000 <= CalcCreditLimitLCYExpendedPct;
        DaysPastDueDate := AgedAccReceivable.InvoicePaymentDaysAverage("No.");
        AttentionToPaidDay := DaysPastDueDate > 0;
    end;

    trigger OnInit();
    var
        ApplicationAreaSetup : Record "Application Area Setup";
    begin
        FoundationOnly := ApplicationAreaSetup.IsFoundationEnabled;

        SetCustomerNoVisibilityOnFactBoxes;

        ContactEditable := true;

        OpenApprovalEntriesExistCurrUser := true;

        CaptionTxt := CurrPage.CAPTION;
        SetCaption(CaptionTxt);
        CurrPage.CAPTION(CaptionTxt);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    var
        DocumentNoVisibility : Codeunit DocumentNoVisibility;
    begin
        if GUIALLOWED then
          if "No." = '' then
            if DocumentNoVisibility.CustomerNoSeriesIsDefault then
              NewMode := true;
    end;

    trigger OnOpenPage();
    var
        OfficeManagement : Codeunit "Office Management";
        PermissionManager : Codeunit "Permission Manager";
    begin
        ActivateFields;

        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;

        SetNoFieldVisible;
        IsOfficeAddin := OfficeManagement.IsAvailable;
        IsSaaS := PermissionManager.SoftwareAsAService;

        if FoundationOnly then
          CurrPage.PriceAndLineDisc.PAGE.InitPage(false);

        ShowCharts := "No." <> '';
        SETFILTER("Date Filter",CustomerMgt.GetCurrentYearFilter);
    end;

    var
        CustomizedCalEntry : Record "Customized Calendar Entry";
        CustomizedCalendar : Record "Customized Calendar Change";
        CalendarMgmt : Codeunit "Calendar Management";
        ApprovalsMgmt : Codeunit "Approvals Mgmt.";
        CRMIntegrationManagement : Codeunit "CRM Integration Management";
        CustomerMgt : Codeunit "Customer Mgt.";
        StyleTxt : Text;
        [InDataSet]
        ContactEditable : Boolean;
        [InDataSet]
        SocialListeningSetupVisible : Boolean;
        [InDataSet]
        SocialListeningVisible : Boolean;
        [InDataSet]
        ShowCharts : Boolean;
        CRMIntegrationEnabled : Boolean;
        CRMIsCoupledToRecord : Boolean;
        OpenApprovalEntriesExistCurrUser : Boolean;
        OpenApprovalEntriesExist : Boolean;
        ShowWorkflowStatus : Boolean;
        NoFieldVisible : Boolean;
        BalanceExhausted : Boolean;
        AttentionToPaidDay : Boolean;
        IsOfficeAddin : Boolean;
        NoPostedInvoices : Integer;
        NoPostedCrMemos : Integer;
        NoOutstandingInvoices : Integer;
        NoOutstandingCrMemos : Integer;
        Totals : Decimal;
        AmountOnPostedInvoices : Decimal;
        AmountOnPostedCrMemos : Decimal;
        AmountOnOutstandingInvoices : Decimal;
        AmountOnOutstandingCrMemos : Decimal;
        AdjmtCostLCY : Decimal;
        AdjCustProfit : Decimal;
        CustProfit : Decimal;
        AdjProfitPct : Decimal;
        CustInvDiscAmountLCY : Decimal;
        CustPaymentsLCY : Decimal;
        CustSalesLCY : Decimal;
        OverduePaymentsMsg : TextConst Comment='Overdue Payments as of 27-02-2012',ENU='Overdue Payments as of %1',FRB='Paiements échus au %1',NLB='Achterstallige betalingen op %1';
        DaysPastDueDate : Decimal;
        PostedInvoicesMsg : TextConst Comment='Invoices (5)',ENU='Posted Invoices (%1)',FRB='Factures enregistrées (%1)',NLB='Geboekte facturen (%1)';
        CreditMemosMsg : TextConst Comment='Credit Memos (3)',ENU='Posted Credit Memos (%1)',FRB='Avoirs enregistrés (%1)',NLB='Geboekte creditnota''s (%1)';
        OutstandingInvoicesMsg : TextConst Comment='Ongoing Invoices (4)',ENU='Ongoing Invoices (%1)',FRB='Factures en cours (%1)',NLB='Doorlopende facturen (%1)';
        OutstandingCrMemosMsg : TextConst Comment='Ongoing Credit Memos (4)',ENU='Ongoing Credit Memos (%1)',FRB='Avoirs en cours (%1)',NLB='Lopende creditnota''s (%1)';
        ShowMapLbl : TextConst ENU='Show on Map',FRB='Afficher sur une carte',NLB='Weergeven op kaart';
        FoundationOnly : Boolean;
        CanCancelApprovalForRecord : Boolean;
        EnabledApprovalWorkflowsExist : Boolean;
        NewMode : Boolean;
        EventFilter : Text;
        CaptionTxt : Text;
        CanRequestApprovalForFlow : Boolean;
        CanCancelApprovalForFlow : Boolean;
        IsSaaS : Boolean;

    local procedure GetTotalSales() : Decimal;
    begin
        NoPostedInvoices := 0;
        NoPostedCrMemos := 0;
        NoOutstandingInvoices := 0;
        NoOutstandingCrMemos := 0;
        Totals := 0;

        AmountOnPostedInvoices := CustomerMgt.CalcAmountsOnPostedInvoices("No.",NoPostedInvoices);
        AmountOnPostedCrMemos := CustomerMgt.CalcAmountsOnPostedCrMemos("No.",NoPostedCrMemos);

        AmountOnOutstandingInvoices := CustomerMgt.CalculateAmountsOnUnpostedInvoices("No.",NoOutstandingInvoices);
        AmountOnOutstandingCrMemos := CustomerMgt.CalculateAmountsOnUnpostedCrMemos("No.",NoOutstandingCrMemos);

        Totals := AmountOnPostedInvoices + AmountOnPostedCrMemos + AmountOnOutstandingInvoices + AmountOnOutstandingCrMemos;

        CustomerMgt.CalculateStatistic(
          Rec,
          AdjmtCostLCY,AdjCustProfit,AdjProfitPct,
          CustInvDiscAmountLCY,CustPaymentsLCY,CustSalesLCY,
          CustProfit);
        exit(Totals)
    end;

    local procedure GetAmountOnPostedInvoices() : Decimal;
    begin
        exit(AmountOnPostedInvoices)
    end;

    local procedure GetAmountOnCrMemo() : Decimal;
    begin
        exit(AmountOnPostedCrMemos)
    end;

    local procedure GetAmountOnOutstandingInvoices() : Decimal;
    begin
        exit(AmountOnOutstandingInvoices)
    end;

    local procedure GetAmountOnOutstandingCrMemos() : Decimal;
    begin
        exit(AmountOnOutstandingCrMemos)
    end;

    local procedure GetMoneyOwedExpected() : Decimal;
    begin
        exit(CustomerMgt.CalculateAmountsWithVATOnUnpostedDocuments("No."))
    end;

    local procedure GetSalesPricesAndSalesLineDisc();
    begin
        if "No." <> CurrPage.PriceAndLineDisc.PAGE.GetLoadedCustNo then begin
          CurrPage.PriceAndLineDisc.PAGE.LoadCustomer(Rec);
          CurrPage.PriceAndLineDisc.PAGE.UPDATE(false);
        end;
    end;

    local procedure ActivateFields();
    begin
        SetSocialListeningFactboxVisibility;
        ContactEditable := "Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate();
    begin
        ActivateFields;
    end;

    local procedure SetSocialListeningFactboxVisibility();
    var
        SocialListeningMgt : Codeunit "Social Listening Management";
    begin
        SocialListeningMgt.GetCustFactboxVisibility(Rec,SocialListeningSetupVisible,SocialListeningVisible);
    end;

    local procedure SetNoFieldVisible();
    var
        DocumentNoVisibility : Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.CustomerNoIsVisible;
    end;

    local procedure SetCustomerNoVisibilityOnFactBoxes();
    begin
        CurrPage.SalesHistSelltoFactBox.PAGE.SetCustomerNoVisibility(false);
        CurrPage.SalesHistBilltoFactBox.PAGE.SetCustomerNoVisibility(false);
        CurrPage.CustomerStatisticsFactBox.PAGE.SetCustomerNoVisibility(false);
    end;

    [Scope('Personalization')]
    procedure RunReport(ReportNumber : Integer;CustomerNumber : Code[20]);
    var
        Customer : Record Customer;
    begin
        Customer.SETRANGE("No.",CustomerNumber);
        REPORT.RUNMODAL(ReportNumber,true,true,Customer);
    end;

    local procedure CreateCustomerFromTemplate();
    var
        MiniCustomerTemplate : Record "Mini Customer Template";
        Customer : Record Customer;
        VATRegNoSrvConfig : Record "VAT Reg. No. Srv Config";
        EUVATRegistrationNoCheck : Page "EU VAT Registration No Check";
        CustomerRecRef : RecordRef;
    begin
        OnBeforeCreateCustomerFromTemplate(NewMode);

        if NewMode then begin
          if MiniCustomerTemplate.NewCustomerFromTemplate(Customer) then begin
            if VATRegNoSrvConfig.VATRegNoSrvIsEnabled then
              if Customer."Validate EU Vat Reg. No." then begin
                EUVATRegistrationNoCheck.SetRecordRef(Customer);
                COMMIT;
                EUVATRegistrationNoCheck.RUNMODAL;
                EUVATRegistrationNoCheck.GetRecordRef(CustomerRecRef);
                CustomerRecRef.SETTABLE(Customer);
              end;

            COPY(Customer);
            CurrPage.UPDATE;
          end;
          NewMode := false;
        end;
    end;

    [IntegrationEvent(false, false)]
    procedure SetCaption(var InText : Text);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateCustomerFromTemplate(var NewMode : Boolean);
    begin
    end;
}

