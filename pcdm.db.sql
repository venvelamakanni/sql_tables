BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "account" (
	"account_id"	INTEGER NOT NULL,
	"account_type_code"	INTEGER,
	"account_name"	VARCHAR,
	PRIMARY KEY("account_id")
);
CREATE TABLE IF NOT EXISTS "account_agreement" (
	"account_agreement_id"	INTEGER NOT NULL,
	"account_id"	INTEGER,
	"agreement_id"	INTEGER,
	PRIMARY KEY("account_agreement_id"),
	FOREIGN KEY("account_id") REFERENCES "account"("account_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "account_party_role" (
	"account_party_role_id"	INTEGER NOT NULL,
	"account_id"	INTEGER,
	"party_role_code"	VARCHAR,
	"party_id"	INTEGER,
	PRIMARY KEY("account_party_role_id"),
	FOREIGN KEY("account_id") REFERENCES "account"("account_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "account_provider" (
	"account_provider_id"	INTEGER NOT NULL,
	"financial_service_id"	INTEGER,
	PRIMARY KEY("account_provider_id"),
	FOREIGN KEY("financial_service_id") REFERENCES "financial_service"("financial_service_id")
);
CREATE TABLE IF NOT EXISTS "account_role" (
	"account_role_id"	INTEGER NOT NULL,
	"provider_id"	VARCHAR,
	PRIMARY KEY("account_role_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "accountability" (
	"accountability_id"	INTEGER NOT NULL,
	"staff_role_id"	INTEGER,
	PRIMARY KEY("accountability_id"),
	FOREIGN KEY("staff_role_id") REFERENCES "staff_role"("staff_role_id")
);
CREATE TABLE IF NOT EXISTS "additional_interest" (
	"additional_interest_id"	INTEGER NOT NULL,
	"financial_interest_role_id"	INTEGER,
	PRIMARY KEY("additional_interest_id"),
	FOREIGN KEY("financial_interest_role_id") REFERENCES "financial_interest_role"("financial_interest_role_id")
);
CREATE TABLE IF NOT EXISTS "adjuster" (
	"adjuster_id"	INTEGER NOT NULL,
	"party_role_code"	VARCHAR,
	PRIMARY KEY("adjuster_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "administrative_organization_unit" (
	"administrative_organization_unit_id"	INTEGER NOT NULL,
	"organization_unit_id"	INTEGER,
	PRIMARY KEY("administrative_organization_unit_id"),
	FOREIGN KEY("organization_unit_id") REFERENCES "organization_unit"("organization_unit_id")
);
CREATE TABLE IF NOT EXISTS "agency_contract" (
	"agency_contract_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("agency_contract_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "agent" (
	"agent_id"	INTEGER NOT NULL,
	"producer_id"	INTEGER,
	PRIMARY KEY("agent_id"),
	FOREIGN KEY("producer_id") REFERENCES "producer"("producer_id")
);
CREATE TABLE IF NOT EXISTS "agreement" (
	"agreement_id"	INTEGER NOT NULL,
	"agreement_type_code"	INTEGER,
	"agreement_name"	VARCHAR,
	"agreement_original_inception_date"	DATE,
	"product_id"	INTEGER,
	PRIMARY KEY("agreement_id"),
	FOREIGN KEY("product_id") REFERENCES "product"("product_id")
);
CREATE TABLE IF NOT EXISTS "agreement_assessment" (
	"agreement_assessment_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	"assessment_id"	INTEGER,
	PRIMARY KEY("agreement_assessment_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id"),
	FOREIGN KEY("assessment_id") REFERENCES "assessment"("assessment_id")
);
CREATE TABLE IF NOT EXISTS "agreement_party_role" (
	"agreement_party_role_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	"party_role_code"	VARCHAR,
	"effective_date"	DATE,
	"party_id"	INTEGER,
	"expiration_date"	DATE,
	PRIMARY KEY("agreement_party_role_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "agreement_role" (
	"agreement_role_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("agreement_role_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "animal" (
	"animal_id"	INTEGER NOT NULL,
	"body_object_id"	INTEGER,
	PRIMARY KEY("animal_id"),
	FOREIGN KEY("body_object_id") REFERENCES "body_object"("body_object_id")
);
CREATE TABLE IF NOT EXISTS "approval" (
	"approval_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("approval_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "arbitration" (
	"arbitration_id"	INTEGER NOT NULL,
	"arbitration_description"	VARCHAR,
	PRIMARY KEY("arbitration_id")
);
CREATE TABLE IF NOT EXISTS "arbitration_party_role" (
	"arbitration_party_id"	INTEGER NOT NULL,
	"arbitration_id"	INTEGER,
	"party_id"	INTEGER,
	"party_role_code"	VARCHAR,
	"begin_date"	DATE,
	"claim_id"	INTEGER,
	"end_date"	DATE,
	PRIMARY KEY("arbitration_party_id"),
	FOREIGN KEY("arbitration_id") REFERENCES "arbitration"("arbitration_id"),
	FOREIGN KEY("claim_id") REFERENCES "claim"("claim_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "assessment" (
	"assessment_id"	INTEGER NOT NULL,
	"begin_date"	DATE,
	"end_date"	DATE,
	"assessment_description"	VARCHAR,
	"assessment_reason_description"	VARCHAR,
	PRIMARY KEY("assessment_id")
);
CREATE TABLE IF NOT EXISTS "assessment_party_role" (
	"assessment_party_role_id"	INTEGER NOT NULL,
	"party_id"	INTEGER,
	"party_role_code"	VARCHAR,
	"assessment_id"	INTEGER,
	"begin_date"	DATE,
	"end_date"	DATE,
	PRIMARY KEY("assessment_party_role_id"),
	FOREIGN KEY("assessment_id") REFERENCES "assessment"("assessment_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "assessment_result" (
	"assessment_result_id"	INTEGER NOT NULL,
	"assessment_id"	INTEGER,
	"assessment_result_type_code"	INTEGER,
	PRIMARY KEY("assessment_result_id"),
	FOREIGN KEY("assessment_id") REFERENCES "assessment"("assessment_id")
);
CREATE TABLE IF NOT EXISTS "assumed_claim_amount" (
	"assumed_claim_amount_id"	INTEGER NOT NULL,
	"claim_amount_id"	INTEGER,
	PRIMARY KEY("assumed_claim_amount_id"),
	FOREIGN KEY("claim_amount_id") REFERENCES "claim_amount"("claim_amount_id")
);
CREATE TABLE IF NOT EXISTS "assumed_policy_amount" (
	"assumed_policy_amount_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("assumed_policy_amount_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "attorney" (
	"attorney_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("attorney_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "audit" (
	"audit_id"	INTEGER NOT NULL,
	"endorsement_id"	INTEGER,
	PRIMARY KEY("audit_id"),
	FOREIGN KEY("endorsement_id") REFERENCES "endorsement"("endorsement_id")
);
CREATE TABLE IF NOT EXISTS "auditor" (
	"auditor_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("auditor_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "auto_repair_shop_contract" (
	"auto_repair_shop_contract_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("auto_repair_shop_contract_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "automobile" (
	"automobile_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("automobile_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "binding" (
	"binding_id"	INTEGER NOT NULL,
	"policy_event_id"	INTEGER,
	PRIMARY KEY("binding_id"),
	FOREIGN KEY("policy_event_id") REFERENCES "policy_event"("policy_event_id")
);
CREATE TABLE IF NOT EXISTS "boat" (
	"boat_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("boat_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "body_object" (
	"body_object_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	PRIMARY KEY("body_object_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id")
);
CREATE TABLE IF NOT EXISTS "branch_office" (
	"branch_office_id"	INTEGER NOT NULL,
	"regional_office_id"	INTEGER,
	PRIMARY KEY("branch_office_id"),
	FOREIGN KEY("regional_office_id") REFERENCES "regional_office"("regional_office_id")
);
CREATE TABLE IF NOT EXISTS "broker" (
	"broker_id"	INTEGER NOT NULL,
	"producer_id"	INTEGER,
	PRIMARY KEY("broker_id"),
	FOREIGN KEY("producer_id") REFERENCES "producer"("producer_id")
);
CREATE TABLE IF NOT EXISTS "brokerage_contract" (
	"brokerage_contract_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("brokerage_contract_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "bus" (
	"bus_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("bus_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "business_event" (
	"business_event_id"	INTEGER NOT NULL,
	"event_id"	INTEGER,
	PRIMARY KEY("business_event_id"),
	FOREIGN KEY("event_id") REFERENCES "event"("event_id")
);
CREATE TABLE IF NOT EXISTS "buyer" (
	"buyer_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("buyer_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "cancel" (
	"cancel_id"	INTEGER NOT NULL,
	"policy_event_id"	INTEGER,
	PRIMARY KEY("cancel_id"),
	FOREIGN KEY("policy_event_id") REFERENCES "policy_event"("policy_event_id")
);
CREATE TABLE IF NOT EXISTS "catastrophe" (
	"catastrophe_id"	INTEGER NOT NULL,
	"catastrophe_type_code"	INTEGER,
	"catastrophe_name"	VARCHAR,
	"industry_catastrophe_code"	INTEGER,
	"company_catastrophe_code"	INTEGER,
	PRIMARY KEY("catastrophe_id")
);
CREATE TABLE IF NOT EXISTS "ceded_claim_amount" (
	"ceded_claim_amount_id"	INTEGER NOT NULL,
	"claim_amount_id"	INTEGER,
	PRIMARY KEY("ceded_claim_amount_id"),
	FOREIGN KEY("claim_amount_id") REFERENCES "claim_amount"("claim_amount_id")
);
CREATE TABLE IF NOT EXISTS "ceded_policy_amount" (
	"ceded_policy_amount_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("ceded_policy_amount_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "channel_role" (
	"channel_role_id"	INTEGER NOT NULL,
	"agreement_role_id"	INTEGER,
	PRIMARY KEY("channel_role_id"),
	FOREIGN KEY("agreement_role_id") REFERENCES "agreement_role"("agreement_role_id")
);
CREATE TABLE IF NOT EXISTS "channel_score" (
	"channel_score_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("channel_score_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "claim" (
	"claim_id"	INTEGER NOT NULL,
	"occurrence_id"	INTEGER,
	"catastrophe_id"	INTEGER,
	"insurable_object_id"	INTEGER,
	"company_claim_number"	INTEGER,
	"company_subclaim_number"	INTEGER,
	"claim_description"	VARCHAR,
	"claim_open_date"	DATE,
	"claim_close_date"	DATE,
	"claim_reopen_date"	DATE,
	"claim_status_code"	VARCHAR,
	"claim_reported_date"	DATE,
	"claims_made_date"	DATE,
	"entry_in_to_claims_made_program_date"	DATE,
	PRIMARY KEY("claim_id"),
	FOREIGN KEY("catastrophe_id") REFERENCES "catastrophe"("catastrophe_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id"),
	FOREIGN KEY("occurrence_id") REFERENCES "occurrence"("occurrence_id")
);
CREATE TABLE IF NOT EXISTS "claim_administrator" (
	"claim_administrator_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claim_administrator_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "claim_amount" (
	"claim_amount_id"	INTEGER NOT NULL,
	"claim_id"	INTEGER,
	"claim_offer_id"	INTEGER,
	"event_date"	DATE,
	"insurance_type_code"	INTEGER,
	"amount_type_code"	INTEGER,
	"claim_amount"	FLOAT,
	PRIMARY KEY("claim_amount_id"),
	FOREIGN KEY("claim_id") REFERENCES "claim"("claim_id"),
	FOREIGN KEY("claim_offer_id") REFERENCES "claim_offer"("claim_offer_id")
);
CREATE TABLE IF NOT EXISTS "claim_arbitration" (
	"claim_arbitration_id"	INTEGER NOT NULL,
	"claim_id"	INTEGER,
	"arbitration_id"	INTEGER,
	PRIMARY KEY("claim_arbitration_id"),
	FOREIGN KEY("arbitration_id") REFERENCES "arbitration"("arbitration_id"),
	FOREIGN KEY("claim_id") REFERENCES "claim"("claim_id")
);
CREATE TABLE IF NOT EXISTS "claim_assessment" (
	"claim_assessment_id"	INTEGER NOT NULL,
	"claim_id"	INTEGER,
	"assessment_id"	INTEGER,
	PRIMARY KEY("claim_assessment_id"),
	FOREIGN KEY("assessment_id") REFERENCES "assessment"("assessment_id"),
	FOREIGN KEY("claim_id") REFERENCES "claim"("claim_id")
);
CREATE TABLE IF NOT EXISTS "claim_coverage" (
	"claim_coverage_id"	INTEGER NOT NULL,
	"claim_id"	INTEGER,
	"policy_coverage_detail_id"	INTEGER,
	PRIMARY KEY("claim_coverage_id"),
	FOREIGN KEY("claim_id") REFERENCES "claim"("claim_id"),
	FOREIGN KEY("policy_coverage_detail_id") REFERENCES "policy_coverage_detail"("policy_coverage_detail_id")
);
CREATE TABLE IF NOT EXISTS "claim_evaluation_result" (
	"claim_evaluation_result_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("claim_evaluation_result_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "claim_event" (
	"claim_event_id"	INTEGER NOT NULL,
	"event_id"	INTEGER,
	PRIMARY KEY("claim_event_id"),
	FOREIGN KEY("event_id") REFERENCES "event"("event_id")
);
CREATE TABLE IF NOT EXISTS "claim_examiner" (
	"claim_examiner_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claim_examiner_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "claim_expert" (
	"claim_expert_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claim_expert_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "claim_folder" (
	"claim_folder_id"	INTEGER NOT NULL,
	"claim_id"	INTEGER,
	"claim_folder_label_name"	VARCHAR,
	PRIMARY KEY("claim_folder_id"),
	FOREIGN KEY("claim_id") REFERENCES "claim"("claim_id")
);
CREATE TABLE IF NOT EXISTS "claim_folder_document" (
	"claim_folder_document_id"	INTEGER NOT NULL,
	"claim_folder_id"	INTEGER,
	"document_sequence_number"	INTEGER,
	"document_link_value"	INTEGER,
	PRIMARY KEY("claim_folder_document_id"),
	FOREIGN KEY("claim_folder_id") REFERENCES "claim_folder"("claim_folder_id")
);
CREATE TABLE IF NOT EXISTS "claim_fraud_examiner" (
	"claim_fraud_examiner_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claim_fraud_examiner_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "claim_legal_expert" (
	"claim_legal_expert_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claim_legal_expert_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "claim_litigation" (
	"claim_litigation_id"	INTEGER NOT NULL,
	"claim_id"	INTEGER,
	"litigation_id"	INTEGER,
	PRIMARY KEY("claim_litigation_id"),
	FOREIGN KEY("claim_id") REFERENCES "claim"("claim_id"),
	FOREIGN KEY("litigation_id") REFERENCES "litigation"("litigation_id")
);
CREATE TABLE IF NOT EXISTS "claim_offer" (
	"claim_offer_id"	INTEGER NOT NULL,
	"claim_folder_id"	INTEGER,
	"arbitration_id"	INTEGER,
	"litigation_id"	INTEGER,
	"settlement_offer_amount"	FLOAT,
	"settlement_offer_provision_description"	VARCHAR,
	PRIMARY KEY("claim_offer_id"),
	FOREIGN KEY("arbitration_id") REFERENCES "arbitration"("arbitration_id"),
	FOREIGN KEY("claim_folder_id") REFERENCES "claim_folder"("claim_folder_id"),
	FOREIGN KEY("litigation_id") REFERENCES "litigation"("litigation_id")
);
CREATE TABLE IF NOT EXISTS "claim_party_role" (
	"claim_party_role_id"	INTEGER NOT NULL,
	"party_role_code"	VARCHAR,
	"begin_date"	DATE,
	"party_id"	INTEGER,
	"end_date"	DATE,
	PRIMARY KEY("claim_party_role_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "claim_payment" (
	"claim_payment_id"	INTEGER NOT NULL,
	"claim_amount_id"	INTEGER,
	PRIMARY KEY("claim_payment_id"),
	FOREIGN KEY("claim_amount_id") REFERENCES "claim_amount"("claim_amount_id")
);
CREATE TABLE IF NOT EXISTS "claim_representative" (
	"claim_representative_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claim_representative_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "claim_reserve" (
	"claim_reserve_id"	INTEGER NOT NULL,
	"claim_amount_id"	INTEGER,
	PRIMARY KEY("claim_reserve_id"),
	FOREIGN KEY("claim_amount_id") REFERENCES "claim_amount"("claim_amount_id")
);
CREATE TABLE IF NOT EXISTS "claim_role" (
	"claim_role_id"	INTEGER NOT NULL,
	"party_role_code"	VARCHAR,
	PRIMARY KEY("claim_role_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "claim_witness" (
	"claim_witness_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claim_witness_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "claimant" (
	"claimant_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claimant_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "claimee" (
	"claimee_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("claimee_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "combination_structure" (
	"combination_structure_id"	INTEGER NOT NULL,
	"structure_id"	INTEGER,
	PRIMARY KEY("combination_structure_id"),
	FOREIGN KEY("structure_id") REFERENCES "structure"("structure_id")
);
CREATE TABLE IF NOT EXISTS "combine" (
	"combine_id"	INTEGER NOT NULL,
	"farm_equipment_id"	INTEGER,
	PRIMARY KEY("combine_id"),
	FOREIGN KEY("farm_equipment_id") REFERENCES "farm_equipment"("farm_equipment_id")
);
CREATE TABLE IF NOT EXISTS "commercial_agreement" (
	"commercial_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("commercial_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "commercial_structure" (
	"commercial_structure_id"	INTEGER NOT NULL,
	"structure_id"	INTEGER,
	PRIMARY KEY("commercial_structure_id"),
	FOREIGN KEY("structure_id") REFERENCES "structure"("structure_id")
);
CREATE TABLE IF NOT EXISTS "communication_identity" (
	"communication_id"	INTEGER NOT NULL,
	"communication_type_code"	VARCHAR,
	"communication_value"	VARCHAR,
	"communication_qualifier_value"	VARCHAR,
	"geographic_location_id"	INTEGER,
	PRIMARY KEY("communication_id"),
	FOREIGN KEY("geographic_location_id") REFERENCES "geographic_location"("geographic_location_id")
);
CREATE TABLE IF NOT EXISTS "commutation_agreement" (
	"commutation_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("commutation_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "company" (
	"company_id"	INTEGER NOT NULL,
	"company_code"	INTEGER,
	"company_name"	VARCHAR,
	"company_description"	VARCHAR,
	PRIMARY KEY("company_id")
);
CREATE TABLE IF NOT EXISTS "company_jurisdiction" (
	"company_jurisdiction_id"	INTEGER NOT NULL,
	"company_id"	INTEGER,
	"geographic_location_id"	INTEGER,
	PRIMARY KEY("company_jurisdiction_id"),
	FOREIGN KEY("company_id") REFERENCES "company"("company_id"),
	FOREIGN KEY("geographic_location_id") REFERENCES "geographic_location"("geographic_location_id")
);
CREATE TABLE IF NOT EXISTS "construction_vehicle" (
	"construction_vehicle_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("construction_vehicle_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "consultant_contract" (
	"consultant_contract_id"	INTEGER NOT NULL,
	"staffing_agreement_id"	INTEGER,
	PRIMARY KEY("consultant_contract_id"),
	FOREIGN KEY("staffing_agreement_id") REFERENCES "staffing_agreement"("staffing_agreement_id")
);
CREATE TABLE IF NOT EXISTS "contractor" (
	"contractor_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("contractor_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "court_jurisdiction" (
	"court_jurisdiction_id"	INTEGER NOT NULL,
	"court_id"	INTEGER,
	"jurisdiction_id"	INTEGER,
	PRIMARY KEY("court_jurisdiction_id")
);
CREATE TABLE IF NOT EXISTS "coverage" (
	"coverage_id"	INTEGER NOT NULL,
	"coverage_part_code"	INTEGER,
	"coverage_type_id"	INTEGER,
	"coverage_name"	VARCHAR,
	"coverage_description"	VARCHAR,
	"coverage_group_id"	INTEGER,
	PRIMARY KEY("coverage_id"),
	FOREIGN KEY("coverage_group_id") REFERENCES "coverage_group"("coverage_group_id"),
	FOREIGN KEY("coverage_part_code") REFERENCES "coverage_part"("coverage_part_code"),
	FOREIGN KEY("coverage_type_id") REFERENCES "coverage_type"("coverage_type_id")
);
CREATE TABLE IF NOT EXISTS "coverage_group" (
	"coverage_group_id"	INTEGER NOT NULL,
	"coverage_group_name"	VARCHAR,
	"coverage_group_description"	VARCHAR,
	PRIMARY KEY("coverage_group_id")
);
CREATE TABLE IF NOT EXISTS "coverage_level" (
	"coverage_level_id"	INTEGER NOT NULL,
	"coverage_id"	INTEGER,
	"coverage_limit_type_id"	INTEGER,
	"maximum_per_person_amount"	FLOAT,
	"aggregate_limit_amount"	FLOAT,
	"maximum_per_claim_amount"	FLOAT,
	"deductible_rate"	FLOAT,
	"coverage_label_name"	VARCHAR,
	PRIMARY KEY("coverage_level_id"),
	FOREIGN KEY("coverage_id") REFERENCES "coverage"("coverage_id"),
	FOREIGN KEY("coverage_limit_type_id") REFERENCES "coverage_limit_type"("coverage_limit_type_id")
);
CREATE TABLE IF NOT EXISTS "coverage_limit_type" (
	"coverage_limit_type_id"	INTEGER NOT NULL,
	"coverage_limit_name"	VARCHAR,
	"coverage_limit_description"	VARCHAR,
	PRIMARY KEY("coverage_limit_type_id")
);
CREATE TABLE IF NOT EXISTS "coverage_part" (
	"coverage_part_code"	INTEGER NOT NULL,
	"coverage_part_name"	VARCHAR,
	PRIMARY KEY("coverage_part_code")
);
CREATE TABLE IF NOT EXISTS "coverage_type" (
	"coverage_type_id"	INTEGER NOT NULL,
	"coverage_type_name"	VARCHAR,
	"coverage_type_description"	VARCHAR,
	PRIMARY KEY("coverage_type_id")
);
CREATE TABLE IF NOT EXISTS "credit_claim_amount" (
	"credit_claim_amount_id"	INTEGER NOT NULL,
	"claim_amount_id"	INTEGER,
	PRIMARY KEY("credit_claim_amount_id"),
	FOREIGN KEY("claim_amount_id") REFERENCES "claim_amount"("claim_amount_id")
);
CREATE TABLE IF NOT EXISTS "credit_policy_amount" (
	"credit_policy_amount_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("credit_policy_amount_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "credit_rating" (
	"credit_rating_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("credit_rating_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "customer" (
	"prospect_id"	INTEGER NOT NULL,
	"account_role_id"	INTEGER,
	PRIMARY KEY("prospect_id"),
	FOREIGN KEY("account_role_id") REFERENCES "account_role"("account_role_id")
);
CREATE TABLE IF NOT EXISTS "customer_score" (
	"customer_score_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("customer_score_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "debit_claim_amount" (
	"debit_claim_amount_id"	INTEGER NOT NULL,
	"claim_amount_id"	INTEGER,
	PRIMARY KEY("debit_claim_amount_id"),
	FOREIGN KEY("claim_amount_id") REFERENCES "claim_amount"("claim_amount_id")
);
CREATE TABLE IF NOT EXISTS "debit_policy_amount" (
	"debit_policy_amount_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("debit_policy_amount_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "deductible_recovery" (
	"deductible_recovery_id"	INTEGER NOT NULL,
	"recovery_id"	INTEGER,
	PRIMARY KEY("deductible_recovery_id"),
	FOREIGN KEY("recovery_id") REFERENCES "recovery"("recovery_id")
);
CREATE TABLE IF NOT EXISTS "demographic_score" (
	"demographic_score_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("demographic_score_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "department" (
	"department_id"	INTEGER NOT NULL,
	"administrative_organization_unit_id"	INTEGER,
	PRIMARY KEY("department_id"),
	FOREIGN KEY("administrative_organization_unit_id") REFERENCES "administrative_organization_unit"("administrative_organization_unit_id")
);
CREATE TABLE IF NOT EXISTS "derivative_contract" (
	"derivative_contract_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("derivative_contract_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "direct_claim_amount" (
	"direct_claim_amount_id"	INTEGER NOT NULL,
	"claim_amount_id"	INTEGER,
	PRIMARY KEY("direct_claim_amount_id"),
	FOREIGN KEY("claim_amount_id") REFERENCES "claim_amount"("claim_amount_id")
);
CREATE TABLE IF NOT EXISTS "direct_policy_amount" (
	"direct_policy_amount_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("direct_policy_amount_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "driver" (
	"driver_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("driver_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "dwelling" (
	"dwelling_id"	INTEGER NOT NULL,
	"residential_structure_id"	INTEGER,
	PRIMARY KEY("dwelling_id"),
	FOREIGN KEY("residential_structure_id") REFERENCES "residential_structure"("residential_structure_id")
);
CREATE TABLE IF NOT EXISTS "employment_agreement" (
	"employment_agreement_id"	INTEGER NOT NULL,
	"staffing_agreement_id"	INTEGER,
	PRIMARY KEY("employment_agreement_id"),
	FOREIGN KEY("staffing_agreement_id") REFERENCES "staffing_agreement"("staffing_agreement_id")
);
CREATE TABLE IF NOT EXISTS "endorsement" (
	"endorsement_id"	INTEGER NOT NULL,
	"policy_event_id"	INTEGER,
	PRIMARY KEY("endorsement_id"),
	FOREIGN KEY("policy_event_id") REFERENCES "policy_event"("policy_event_id")
);
CREATE TABLE IF NOT EXISTS "event" (
	"event_id"	INTEGER NOT NULL,
	PRIMARY KEY("event_id")
);
CREATE TABLE IF NOT EXISTS "expense_payment" (
	"expense_payment_id"	INTEGER NOT NULL,
	"claim_payment_id"	INTEGER,
	PRIMARY KEY("expense_payment_id"),
	FOREIGN KEY("claim_payment_id") REFERENCES "claim_payment"("claim_payment_id")
);
CREATE TABLE IF NOT EXISTS "expense_recovery" (
	"expense_recovery_id"	INTEGER NOT NULL,
	"recovery_id"	INTEGER,
	PRIMARY KEY("expense_recovery_id"),
	FOREIGN KEY("recovery_id") REFERENCES "recovery"("recovery_id")
);
CREATE TABLE IF NOT EXISTS "expense_reserve" (
	"expense_reserve_id"	INTEGER NOT NULL,
	"claim_reserve_id"	INTEGER,
	PRIMARY KEY("expense_reserve_id"),
	FOREIGN KEY("claim_reserve_id") REFERENCES "claim_reserve"("claim_reserve_id")
);
CREATE TABLE IF NOT EXISTS "farm_equipment" (
	"farm_equipment_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	PRIMARY KEY("farm_equipment_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id")
);
CREATE TABLE IF NOT EXISTS "fee" (
	"fee_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("fee_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "field_organization_unit" (
	"field_organization_unit_id"	INTEGER NOT NULL,
	"organization_unit_id"	INTEGER,
	PRIMARY KEY("field_organization_unit_id"),
	FOREIGN KEY("organization_unit_id") REFERENCES "organization_unit"("organization_unit_id")
);
CREATE TABLE IF NOT EXISTS "financial_account_agreement" (
	"financial_account_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("financial_account_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "financial_adviser" (
	"financial_adviser_id"	INTEGER NOT NULL,
	"financial_service_id"	INTEGER,
	PRIMARY KEY("financial_adviser_id"),
	FOREIGN KEY("financial_service_id") REFERENCES "financial_service"("financial_service_id")
);
CREATE TABLE IF NOT EXISTS "financial_analyst" (
	"financial_analyst_id"	INTEGER NOT NULL,
	"financial_service_id"	INTEGER,
	PRIMARY KEY("financial_analyst_id"),
	FOREIGN KEY("financial_service_id") REFERENCES "financial_service"("financial_service_id")
);
CREATE TABLE IF NOT EXISTS "financial_interest_role" (
	"financial_interest_role_id"	INTEGER NOT NULL,
	"agreement_role_id"	INTEGER,
	PRIMARY KEY("financial_interest_role_id"),
	FOREIGN KEY("agreement_role_id") REFERENCES "agreement_role"("agreement_role_id")
);
CREATE TABLE IF NOT EXISTS "financial_service" (
	"financial_service_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("financial_service_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "financial_services_assessment" (
	"financial_services_assessment_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("financial_services_assessment_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "financial_valuation" (
	"financial_valuation_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("financial_valuation_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "flat" (
	"flat_id"	INTEGER NOT NULL,
	"cancel_id"	INTEGER,
	PRIMARY KEY("flat_id"),
	FOREIGN KEY("cancel_id") REFERENCES "cancel"("cancel_id")
);
CREATE TABLE IF NOT EXISTS "for_profit_organization" (
	"for_profit_organization_id"	INTEGER NOT NULL,
	"organization_id"	INTEGER,
	PRIMARY KEY("for_profit_organization_id"),
	FOREIGN KEY("organization_id") REFERENCES "organization"("organization_id")
);
CREATE TABLE IF NOT EXISTS "fraud_assessment" (
	"fraud_assessment_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("fraud_assessment_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "freight_group" (
	"freight_group_id"	INTEGER NOT NULL,
	"transportation_class_id"	INTEGER,
	PRIMARY KEY("freight_group_id"),
	FOREIGN KEY("transportation_class_id") REFERENCES "transportation_class"("transportation_class_id")
);
CREATE TABLE IF NOT EXISTS "full_term" (
	"full_term_id"	INTEGER NOT NULL,
	"endorsement_id"	INTEGER,
	PRIMARY KEY("full_term_id"),
	FOREIGN KEY("endorsement_id") REFERENCES "endorsement"("endorsement_id")
);
CREATE TABLE IF NOT EXISTS "geographic_location" (
	"geographic_location_id"	INTEGER NOT NULL,
	"geographic_location_type_code"	VARCHAR,
	"location_code"	VARCHAR,
	"location_name"	VARCHAR,
	"location_number"	VARCHAR,
	"state_code"	VARCHAR,
	"parent_geographic_location_id"	INTEGER,
	"location_address_id"	INTEGER,
	"physical_location_identifier"	INTEGER,
	PRIMARY KEY("geographic_location_id"),
	FOREIGN KEY("location_address_id") REFERENCES "location_address"("location_address_id"),
	FOREIGN KEY("parent_geographic_location_id") REFERENCES "geographic_location"("geographic_location_id"),
	FOREIGN KEY("physical_location_identifier") REFERENCES "physical_location"("physical_location_id"),
	FOREIGN KEY("state_code") REFERENCES "state"("state_code")
);
CREATE TABLE IF NOT EXISTS "government_organization" (
	"government_organization_id"	INTEGER NOT NULL,
	"organization_id"	INTEGER,
	PRIMARY KEY("government_organization_id"),
	FOREIGN KEY("organization_id") REFERENCES "organization"("organization_id")
);
CREATE TABLE IF NOT EXISTS "group_agreement" (
	"group_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("group_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "grouping" (
	"grouping_id"	INTEGER NOT NULL,
	"party_id"	INTEGER,
	"grouping_name"	VARCHAR,
	PRIMARY KEY("grouping_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id")
);
CREATE TABLE IF NOT EXISTS "health_care_provider" (
	"health_care_provider_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("health_care_provider_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "household" (
	"household_id"	INTEGER NOT NULL,
	"grouping_id"	INTEGER,
	PRIMARY KEY("household_id"),
	FOREIGN KEY("grouping_id") REFERENCES "grouping"("grouping_id")
);
CREATE TABLE IF NOT EXISTS "household_content" (
	"household_content_id"	INTEGER NOT NULL,
	"transportation_class_id"	INTEGER,
	"household_id"	INTEGER,
	PRIMARY KEY("household_content_id"),
	FOREIGN KEY("household_id") REFERENCES "household"("household_id"),
	FOREIGN KEY("transportation_class_id") REFERENCES "transportation_class"("transportation_class_id")
);
CREATE TABLE IF NOT EXISTS "household_person" (
	"household_person_id"	INTEGER NOT NULL,
	"household_id"	INTEGER,
	"person_id"	INTEGER,
	PRIMARY KEY("household_person_id"),
	FOREIGN KEY("household_id") REFERENCES "household"("household_id"),
	FOREIGN KEY("person_id") REFERENCES "person"("person_id")
);
CREATE TABLE IF NOT EXISTS "household_person_role" (
	"household_person_role_id"	INTEGER NOT NULL,
	"household_id"	INTEGER,
	"party_role_code"	VARCHAR,
	"begin_date"	DATE,
	"person_id"	INTEGER,
	"end_date"	DATE,
	PRIMARY KEY("household_person_role_id"),
	FOREIGN KEY("household_id") REFERENCES "household"("household_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code"),
	FOREIGN KEY("person_id") REFERENCES "person"("person_id")
);
CREATE TABLE IF NOT EXISTS "independent_adjuster" (
	"independent_adjuster_id"	INTEGER NOT NULL,
	"adjuster_id"	INTEGER,
	PRIMARY KEY("independent_adjuster_id"),
	FOREIGN KEY("adjuster_id") REFERENCES "adjuster"("adjuster_id")
);
CREATE TABLE IF NOT EXISTS "individual_agreement" (
	"individual_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("individual_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "inhouse_adjuster" (
	"inhouse_adjuster_id"	INTEGER NOT NULL,
	"adjuster_id"	INTEGER,
	PRIMARY KEY("inhouse_adjuster_id"),
	FOREIGN KEY("adjuster_id") REFERENCES "adjuster"("adjuster_id")
);
CREATE TABLE IF NOT EXISTS "inpatient" (
	"inpatient_id"	INTEGER NOT NULL,
	"patient_id"	INTEGER,
	PRIMARY KEY("inpatient_id"),
	FOREIGN KEY("patient_id") REFERENCES "patient"("patient_id")
);
CREATE TABLE IF NOT EXISTS "insurable_object" (
	"insurable_object_id"	INTEGER NOT NULL,
	"insurable_object_type_code"	INTEGER,
	"geographic_location_id"	INTEGER,
	PRIMARY KEY("insurable_object_id"),
	FOREIGN KEY("geographic_location_id") REFERENCES "geographic_location"("geographic_location_id")
);
CREATE TABLE IF NOT EXISTS "insurable_object_party_role" (
	"insurable_object_party_role_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	"party_role_code"	VARCHAR,
	"effective_date"	DATE,
	"party_id"	INTEGER,
	"expiration_date"	DATE,
	PRIMARY KEY("insurable_object_party_role_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "insurance_class" (
	"insurance_class_id"	INTEGER NOT NULL,
	"insurance_class_name"	VARCHAR,
	"insurance_class_description"	VARCHAR,
	PRIMARY KEY("insurance_class_id")
);
CREATE TABLE IF NOT EXISTS "insured" (
	"insured_id"	INTEGER NOT NULL,
	"financial_interest_role_id"	INTEGER,
	PRIMARY KEY("insured_id"),
	FOREIGN KEY("financial_interest_role_id") REFERENCES "financial_interest_role"("financial_interest_role_id")
);
CREATE TABLE IF NOT EXISTS "insured_account" (
	"insured_account_id"	INTEGER NOT NULL,
	"account_id"	INTEGER,
	PRIMARY KEY("insured_account_id"),
	FOREIGN KEY("account_id") REFERENCES "account"("account_id")
);
CREATE TABLE IF NOT EXISTS "insurer" (
	"insurer_id"	INTEGER NOT NULL,
	"financial_interest_role_id"	INTEGER,
	PRIMARY KEY("insurer_id"),
	FOREIGN KEY("financial_interest_role_id") REFERENCES "financial_interest_role"("financial_interest_role_id")
);
CREATE TABLE IF NOT EXISTS "intermediary_agreement" (
	"intermediary_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("intermediary_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "legal_adviser" (
	"legal_adviser_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("legal_adviser_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "legal_jurisdiction" (
	"legal_jurisdiction_id"	INTEGER NOT NULL,
	"legal_jurisdiction_name"	VARCHAR,
	"legal_jurisdiction_description"	VARCHAR,
	"rules_preference_description"	VARCHAR,
	PRIMARY KEY("legal_jurisdiction_id")
);
CREATE TABLE IF NOT EXISTS "legal_jurisdiction_party_identity" (
	"legal_jurisdiction_party_id"	INTEGER NOT NULL,
	"legal_jurisdiction_id"	INTEGER,
	"party_id"	INTEGER,
	"legal_identity_type_code"	VARCHAR,
	"legal_classification_code"	VARCHAR,
	PRIMARY KEY("legal_jurisdiction_party_id"),
	FOREIGN KEY("legal_jurisdiction_id") REFERENCES "legal_jurisdiction"("legal_jurisdiction_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id")
);
CREATE TABLE IF NOT EXISTS "life_event" (
	"life_event_id"	INTEGER NOT NULL,
	"event_id"	INTEGER,
	PRIMARY KEY("life_event_id"),
	FOREIGN KEY("event_id") REFERENCES "event"("event_id")
);
CREATE TABLE IF NOT EXISTS "line_of_business" (
	"line_of_business_id"	INTEGER NOT NULL,
	"line_of_business_name"	VARCHAR,
	"line_of_business_description"	VARCHAR,
	"line_of_business_code"	INTEGER,
	"line_of_business_group_id"	INTEGER,
	"insurance_class_id"	INTEGER,
	PRIMARY KEY("line_of_business_id"),
	FOREIGN KEY("insurance_class_id") REFERENCES "insurance_class"("insurance_class_id"),
	FOREIGN KEY("line_of_business_group_id") REFERENCES "line_of_business_group"("line_of_business_group_id")
);
CREATE TABLE IF NOT EXISTS "line_of_business_group" (
	"line_of_business_group_id"	INTEGER NOT NULL,
	"line_of_business_group_name"	VARCHAR,
	"line_of_business_group_description"	VARCHAR,
	PRIMARY KEY("line_of_business_group_id")
);
CREATE TABLE IF NOT EXISTS "litigation" (
	"litigation_id"	INTEGER NOT NULL,
	"court_jurisdiction_id"	INTEGER,
	"litigation_description"	VARCHAR,
	PRIMARY KEY("litigation_id"),
	FOREIGN KEY("court_jurisdiction_id") REFERENCES "court_jurisdiction"("court_jurisdiction_id")
);
CREATE TABLE IF NOT EXISTS "litigation_party_role" (
	"litigation_party_id"	INTEGER NOT NULL,
	"litigation_id"	INTEGER,
	"party_id"	INTEGER,
	"party_role_code"	VARCHAR,
	"begin_date"	DATE,
	"claim_id"	INTEGER,
	"end_date"	DATE,
	PRIMARY KEY("litigation_party_id"),
	FOREIGN KEY("claim_id") REFERENCES "claim"("claim_id"),
	FOREIGN KEY("litigation_id") REFERENCES "litigation"("litigation_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "location_address" (
	"location_address_id"	INTEGER NOT NULL,
	"line_1_address"	VARCHAR,
	"line_2_address"	VARCHAR,
	"municipality_name"	VARCHAR,
	"state_code"	VARCHAR,
	"postal_code"	VARCHAR,
	"country_code"	VARCHAR,
	"begin_date"	DATE,
	"end_date"	DATE,
	PRIMARY KEY("location_address_id")
);
CREATE TABLE IF NOT EXISTS "loss_payee" (
	"loss_payee_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("loss_payee_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "loss_payment" (
	"loss_payment_id"	INTEGER NOT NULL,
	"claim_payment_id"	INTEGER,
	PRIMARY KEY("loss_payment_id"),
	FOREIGN KEY("claim_payment_id") REFERENCES "claim_payment"("claim_payment_id")
);
CREATE TABLE IF NOT EXISTS "loss_recovery" (
	"loss_recovery_id"	INTEGER NOT NULL,
	"recovery_id"	INTEGER,
	PRIMARY KEY("loss_recovery_id"),
	FOREIGN KEY("recovery_id") REFERENCES "recovery"("recovery_id")
);
CREATE TABLE IF NOT EXISTS "loss_reserve" (
	"loss_reserve_id"	INTEGER NOT NULL,
	"claim_reserve_id"	INTEGER,
	PRIMARY KEY("loss_reserve_id"),
	FOREIGN KEY("claim_reserve_id") REFERENCES "claim_reserve"("claim_reserve_id")
);
CREATE TABLE IF NOT EXISTS "manager" (
	"manager_id"	INTEGER NOT NULL,
	"staff_role_id"	INTEGER,
	PRIMARY KEY("manager_id"),
	FOREIGN KEY("staff_role_id") REFERENCES "staff_role"("staff_role_id")
);
CREATE TABLE IF NOT EXISTS "managing_general_agent" (
	"managing_general_agent_id"	INTEGER NOT NULL,
	"producer_id"	INTEGER,
	PRIMARY KEY("managing_general_agent_id"),
	FOREIGN KEY("producer_id") REFERENCES "producer"("producer_id")
);
CREATE TABLE IF NOT EXISTS "manufactured_object" (
	"manufactured_object_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	PRIMARY KEY("manufactured_object_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id")
);
CREATE TABLE IF NOT EXISTS "medical_condition" (
	"medical_condition_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("medical_condition_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "mid_term" (
	"mid_term_id"	INTEGER NOT NULL,
	"endorsement_id"	INTEGER,
	PRIMARY KEY("mid_term_id"),
	FOREIGN KEY("endorsement_id") REFERENCES "endorsement"("endorsement_id")
);
CREATE TABLE IF NOT EXISTS "milking_machine" (
	"milking_machine_id"	INTEGER NOT NULL,
	"farm_equipment_id"	INTEGER,
	PRIMARY KEY("milking_machine_id"),
	FOREIGN KEY("farm_equipment_id") REFERENCES "farm_equipment"("farm_equipment_id")
);
CREATE TABLE IF NOT EXISTS "mobile_home" (
	"mobile_home_id"	INTEGER NOT NULL,
	"residential_structure_id"	INTEGER,
	PRIMARY KEY("mobile_home_id"),
	FOREIGN KEY("residential_structure_id") REFERENCES "residential_structure"("residential_structure_id")
);
CREATE TABLE IF NOT EXISTS "motorcycle" (
	"motorcycle_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("motorcycle_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "mutual_fund_provider" (
	"mutual_fund_provider_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("mutual_fund_provider_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "new_business" (
	"new_business_id"	INTEGER NOT NULL,
	"policy_event_id"	INTEGER,
	PRIMARY KEY("new_business_id"),
	FOREIGN KEY("policy_event_id") REFERENCES "policy_event"("policy_event_id")
);
CREATE TABLE IF NOT EXISTS "not_for_profit_organization" (
	"not_for_profit_organization_id"	INTEGER NOT NULL,
	"organization_id"	INTEGER,
	PRIMARY KEY("not_for_profit_organization_id"),
	FOREIGN KEY("organization_id") REFERENCES "organization"("organization_id")
);
CREATE TABLE IF NOT EXISTS "object_assessment" (
	"object_assessment_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	"assessment_id"	INTEGER,
	PRIMARY KEY("object_assessment_id"),
	FOREIGN KEY("assessment_id") REFERENCES "assessment"("assessment_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id")
);
CREATE TABLE IF NOT EXISTS "occurrence" (
	"occurrence_id"	INTEGER NOT NULL,
	"catastrophic_event_indicator"	INTEGER,
	"geographic_location_id"	INTEGER,
	"occurrence_begin_date"	DATE,
	"occurrence_begin_time"	TIME,
	"occurrence_end_date"	DATE,
	"occurrence_end_time"	TIME,
	PRIMARY KEY("occurrence_id"),
	FOREIGN KEY("geographic_location_id") REFERENCES "geographic_location"("geographic_location_id")
);
CREATE TABLE IF NOT EXISTS "organization" (
	"organization_id"	INTEGER NOT NULL,
	"party_id"	INTEGER,
	"organization_type_code"	INTEGER,
	"organization_name"	VARCHAR,
	"alternate_name"	VARCHAR,
	"acronym_name"	VARCHAR,
	"industry_type_code"	VARCHAR,
	"industry_code"	VARCHAR,
	"dun_and_bradstreet_id"	VARCHAR,
	"organization_description"	VARCHAR,
	PRIMARY KEY("organization_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id")
);
CREATE TABLE IF NOT EXISTS "organization_unit" (
	"organization_unit_id"	INTEGER NOT NULL,
	"organization_id"	INTEGER,
	"organization_unit_name"	VARCHAR,
	"organization_unit_description"	VARCHAR,
	"industry_code"	INTEGER,
	"accounting_code"	INTEGER,
	"work_site_type_code"	INTEGER,
	PRIMARY KEY("organization_unit_id"),
	FOREIGN KEY("organization_id") REFERENCES "organization"("organization_id")
);
CREATE TABLE IF NOT EXISTS "other_assessment_result" (
	"other_assessment_result_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("other_assessment_result_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "outpatient" (
	"outpatient_id"	INTEGER NOT NULL,
	"patient_id"	INTEGER,
	PRIMARY KEY("outpatient_id"),
	FOREIGN KEY("patient_id") REFERENCES "patient"("patient_id")
);
CREATE TABLE IF NOT EXISTS "party" (
	"party_id"	INTEGER NOT NULL,
	"party_name"	VARCHAR,
	"party_type_code"	VARCHAR,
	"begin_date"	DATE,
	"end_date"	DATE,
	PRIMARY KEY("party_id")
);
CREATE TABLE IF NOT EXISTS "party_assessment" (
	"party_assessment_id"	INTEGER NOT NULL,
	"person_id"	INTEGER,
	"assessment_id"	INTEGER,
	"party_id"	INTEGER,
	PRIMARY KEY("party_assessment_id"),
	FOREIGN KEY("assessment_id") REFERENCES "assessment"("assessment_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("person_id") REFERENCES "person"("person_id")
);
CREATE TABLE IF NOT EXISTS "party_communication" (
	"party_communication_id"	INTEGER NOT NULL,
	"party_id"	INTEGER,
	"communication_id"	INTEGER,
	"party_locality_code"	INTEGER,
	"begin_date"	DATE,
	"end_date"	DATE,
	"preference_sequence_number"	INTEGER,
	"preference_day_and_time_group_code"	INTEGER,
	"party_routing_description"	VARCHAR,
	PRIMARY KEY("party_communication_id"),
	FOREIGN KEY("communication_id") REFERENCES "communication_identity"("communication_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id")
);
CREATE TABLE IF NOT EXISTS "party_preference" (
	"party_id"	INTEGER NOT NULL,
	"preferred_language_code"	INTEGER,
	PRIMARY KEY("party_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id")
);
CREATE TABLE IF NOT EXISTS "party_relationship" (
	"party_relationship_id"	INTEGER NOT NULL,
	"party_id"	INTEGER,
	"related_party_id"	INTEGER,
	"relationship_type_code"	VARCHAR,
	"begin_date"	DATE,
	"end_date"	DATE,
	PRIMARY KEY("party_relationship_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id"),
	FOREIGN KEY("related_party_id") REFERENCES "party"("party_id")
);
CREATE TABLE IF NOT EXISTS "party_relationship_role" (
	"party_relationship_role_id"	INTEGER NOT NULL,
	"party_id"	INTEGER,
	"related_party_id"	INTEGER,
	"relationship_type_code"	INTEGER,
	"relationship_begin_date"	DATE,
	"party_role_code"	VARCHAR,
	"role_begin_date"	DATE,
	PRIMARY KEY("party_relationship_role_id"),
	FOREIGN KEY("party_id") REFERENCES "party_relationship"("party_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code"),
	FOREIGN KEY("related_party_id") REFERENCES "party_relationship"("related_party_id"),
	FOREIGN KEY("relationship_begin_date") REFERENCES "party_relationship"("begin_date"),
	FOREIGN KEY("relationship_type_code") REFERENCES "party_relationship"("relationship_type_code")
);
CREATE TABLE IF NOT EXISTS "party_role" (
	"party_role_code"	VARCHAR NOT NULL,
	"party_role_name"	VARCHAR,
	"party_role_description"	VARCHAR,
	PRIMARY KEY("party_role_code")
);
CREATE TABLE IF NOT EXISTS "patient" (
	"patient_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("patient_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "person" (
	"person_id"	INTEGER NOT NULL,
	"party_id"	INTEGER,
	"prefix_name"	VARCHAR,
	"first_name"	VARCHAR,
	"middle_name"	VARCHAR,
	"last_name"	VARCHAR,
	"suffix_name"	VARCHAR,
	"full_legal_name"	VARCHAR,
	"nickname"	VARCHAR,
	"birth_date"	DATE,
	"birth_place_name"	VARCHAR,
	"gender_code"	VARCHAR,
	PRIMARY KEY("person_id"),
	FOREIGN KEY("party_id") REFERENCES "party"("party_id")
);
CREATE TABLE IF NOT EXISTS "person_profession" (
	"person_profession_id"	INTEGER NOT NULL,
	"person_id"	INTEGER,
	"profession_name"	VARCHAR,
	PRIMARY KEY("person_profession_id"),
	FOREIGN KEY("person_id") REFERENCES "person"("person_id")
);
CREATE TABLE IF NOT EXISTS "physical_location" (
	"physical_location_id"	INTEGER NOT NULL,
	"physical_location_name"	VARCHAR,
	"latitude_value"	FLOAT,
	"longitude_value"	FLOAT,
	"altitude_value"	FLOAT,
	"altitude_mean_sea_level_value"	FLOAT,
	"horizontal_accuracy_value"	FLOAT,
	"vertical_accuracy_value"	FLOAT,
	"travel_direction_description"	VARCHAR,
	"location_address_id"	INTEGER,
	PRIMARY KEY("physical_location_id"),
	FOREIGN KEY("location_address_id") REFERENCES "location_address"("location_address_id")
);
CREATE TABLE IF NOT EXISTS "physical_object_assessment" (
	"physical_object_assessment_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("physical_object_assessment_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "place_assessment" (
	"place_assessment_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("place_assessment_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "policy" (
	"policy_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	"policy_number"	INTEGER,
	"effective_date"	DATE,
	"expiration_date"	DATE,
	"status_code"	VARCHAR,
	"geographic_location_id"	INTEGER,
	PRIMARY KEY("policy_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "reinsurance_agreement"("agreement_id"),
	FOREIGN KEY("geographic_location_id") REFERENCES "geographic_location"("geographic_location_id")
);
CREATE TABLE IF NOT EXISTS "policy_amount" (
	"policy_amount_id"	INTEGER NOT NULL,
	"policy_id"	INTEGER,
	"policy_coverage_detail_id"	INTEGER,
	"insurable_object_id"	INTEGER,
	"geographic_location_id"	INTEGER,
	"earning_begin_date"	DATE,
	"earning_end_date"	DATE,
	"insurance_type_code"	INTEGER,
	"amount_type_code"	INTEGER,
	"policy_amount"	FLOAT,
	PRIMARY KEY("policy_amount_id"),
	FOREIGN KEY("geographic_location_id") REFERENCES "geographic_location"("geographic_location_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id"),
	FOREIGN KEY("policy_coverage_detail_id") REFERENCES "policy_coverage_detail"("policy_coverage_detail_id"),
	FOREIGN KEY("policy_id") REFERENCES "policy"("policy_id")
);
CREATE TABLE IF NOT EXISTS "policy_coverage_detail" (
	"policy_coverage_detail_id"	INTEGER NOT NULL,
	"effective_date"	DATE,
	"policy_id"	INTEGER,
	"coverage_part_code"	INTEGER,
	"coverage_id"	INTEGER,
	"insurable_object_id"	INTEGER,
	"expiration_date"	DATE,
	"coverage_inclusion_exclusion_code"	INTEGER,
	"coverage_description"	VARCHAR,
	PRIMARY KEY("policy_coverage_detail_id"),
	FOREIGN KEY("coverage_id") REFERENCES "coverage"("coverage_id"),
	FOREIGN KEY("coverage_part_code") REFERENCES "policy_coverage_part"("coverage_part_code"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id"),
	FOREIGN KEY("policy_id") REFERENCES "policy"("policy_id")
);
CREATE TABLE IF NOT EXISTS "policy_coverage_part" (
	"policy_coverage_part_id"	INTEGER NOT NULL,
	"coverage_part_code"	INTEGER,
	"policy_id"	INTEGER,
	PRIMARY KEY("policy_coverage_part_id"),
	FOREIGN KEY("coverage_part_code") REFERENCES "coverage_part"("coverage_part_code"),
	FOREIGN KEY("policy_id") REFERENCES "policy"("policy_id")
);
CREATE TABLE IF NOT EXISTS "policy_deductible" (
	"policy_deductible_identifier"	INTEGER NOT NULL,
	"policy_coverage_detail_id"	INTEGER,
	"deductible_type_code"	INTEGER,
	"deductible_basis_code"	INTEGER,
	"deductible_value"	FLOAT,
	PRIMARY KEY("policy_deductible_identifier"),
	FOREIGN KEY("policy_coverage_detail_id") REFERENCES "policy_coverage_detail"("policy_coverage_detail_id")
);
CREATE TABLE IF NOT EXISTS "policy_event" (
	"policy_event_id"	INTEGER NOT NULL,
	"event_id"	INTEGER,
	"event_date"	DATE,
	"effective_date"	DATE,
	"event_type_code"	INTEGER,
	"event_sub_type_code"	INTEGER,
	"policy_id"	INTEGER,
	PRIMARY KEY("policy_event_id"),
	FOREIGN KEY("event_id") REFERENCES "event"("event_id"),
	FOREIGN KEY("policy_id") REFERENCES "policy"("policy_id")
);
CREATE TABLE IF NOT EXISTS "policy_form" (
	"policy_form_id"	INTEGER NOT NULL,
	"policy_id"	INTEGER,
	"policy_form_number"	VARCHAR,
	"form_value"	VARCHAR,
	PRIMARY KEY("policy_form_id"),
	FOREIGN KEY("policy_id") REFERENCES "policy"("policy_id")
);
CREATE TABLE IF NOT EXISTS "policy_limit" (
	"policy_limit_id"	INTEGER NOT NULL,
	"policy_coverage_detail_id"	INTEGER,
	"limit_type_code"	INTEGER,
	"limit_basis_code"	INTEGER,
	"limit_value"	FLOAT,
	PRIMARY KEY("policy_limit_id"),
	FOREIGN KEY("policy_coverage_detail_id") REFERENCES "policy_coverage_detail"("policy_coverage_detail_id")
);
CREATE TABLE IF NOT EXISTS "policy_relationship" (
	"policy_relationship_id"	INTEGER NOT NULL,
	"relationship_code"	INTEGER,
	"effective_date"	DATE,
	"policy_id"	INTEGER,
	"related_policy_id"	INTEGER,
	"expiration_date"	DATE,
	PRIMARY KEY("policy_relationship_id"),
	FOREIGN KEY("policy_id") REFERENCES "policy"("policy_id"),
	FOREIGN KEY("related_policy_id") REFERENCES "policy"("policy_id")
);
CREATE TABLE IF NOT EXISTS "pre_qualification" (
	"pre_qualification_id"	INTEGER NOT NULL,
	"policy_event_id"	INTEGER,
	PRIMARY KEY("pre_qualification_id"),
	FOREIGN KEY("policy_event_id") REFERENCES "policy_event"("policy_event_id")
);
CREATE TABLE IF NOT EXISTS "premium" (
	"premium_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("premium_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "premium_auditor" (
	"premium_auditor_id"	INTEGER NOT NULL,
	"auditor_id"	INTEGER,
	PRIMARY KEY("premium_auditor_id"),
	FOREIGN KEY("auditor_id") REFERENCES "auditor"("auditor_id")
);
CREATE TABLE IF NOT EXISTS "pro_rata" (
	"pro_rata_id"	INTEGER NOT NULL,
	"cancel_id"	INTEGER,
	PRIMARY KEY("pro_rata_id"),
	FOREIGN KEY("cancel_id") REFERENCES "cancel"("cancel_id")
);
CREATE TABLE IF NOT EXISTS "producer" (
	"producer_id"	INTEGER NOT NULL,
	"agreement_role_id"	INTEGER,
	PRIMARY KEY("producer_id"),
	FOREIGN KEY("agreement_role_id") REFERENCES "agreement_role"("agreement_role_id")
);
CREATE TABLE IF NOT EXISTS "product" (
	"product_id"	INTEGER NOT NULL,
	"line_of_business_id"	INTEGER,
	"licensed_product_name"	VARCHAR,
	"product_description"	VARCHAR,
	PRIMARY KEY("product_id"),
	FOREIGN KEY("line_of_business_id") REFERENCES "line_of_business"("line_of_business_id")
);
CREATE TABLE IF NOT EXISTS "product_coverage" (
	"product_coverage_id"	INTEGER NOT NULL,
	"product_id"	INTEGER,
	"coverage_id"	INTEGER,
	PRIMARY KEY("product_coverage_id"),
	FOREIGN KEY("coverage_id") REFERENCES "coverage"("coverage_id"),
	FOREIGN KEY("product_id") REFERENCES "product"("product_id")
);
CREATE TABLE IF NOT EXISTS "product_license" (
	"product_license_id"	INTEGER NOT NULL,
	"company_jurisdiction_id"	INTEGER,
	"effective_date"	DATE,
	"expiration_date"	DATE,
	PRIMARY KEY("product_license_id"),
	FOREIGN KEY("company_jurisdiction_id") REFERENCES "company_jurisdiction"("company_jurisdiction_id")
);
CREATE TABLE IF NOT EXISTS "professional_group" (
	"professional_group_id"	INTEGER NOT NULL,
	"grouping_id"	INTEGER,
	PRIMARY KEY("professional_group_id"),
	FOREIGN KEY("grouping_id") REFERENCES "grouping"("grouping_id")
);
CREATE TABLE IF NOT EXISTS "project" (
	"project_id"	INTEGER NOT NULL,
	"grouping_id"	INTEGER,
	PRIMARY KEY("project_id"),
	FOREIGN KEY("grouping_id") REFERENCES "grouping"("grouping_id")
);
CREATE TABLE IF NOT EXISTS "property_in_transit" (
	"property_in_transit_id"	INTEGER NOT NULL,
	"transportation_class_id"	INTEGER,
	PRIMARY KEY("property_in_transit_id"),
	FOREIGN KEY("transportation_class_id") REFERENCES "transportation_class"("transportation_class_id")
);
CREATE TABLE IF NOT EXISTS "prospect" (
	"prospect_id"	INTEGER NOT NULL,
	"account_role_id"	INTEGER,
	PRIMARY KEY("prospect_id"),
	FOREIGN KEY("account_role_id") REFERENCES "account_role"("account_role_id")
);
CREATE TABLE IF NOT EXISTS "provider" (
	"provider_id"	INTEGER NOT NULL,
	"party_role_code"	VARCHAR,
	PRIMARY KEY("provider_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "provider_agreement" (
	"provider_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("provider_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "public_adjuster" (
	"public_adjuster_id"	INTEGER NOT NULL,
	"adjuster_id"	INTEGER,
	PRIMARY KEY("public_adjuster_id"),
	FOREIGN KEY("adjuster_id") REFERENCES "adjuster"("adjuster_id")
);
CREATE TABLE IF NOT EXISTS "quote" (
	"quote_id"	INTEGER NOT NULL,
	"policy_event_id"	INTEGER,
	PRIMARY KEY("quote_id"),
	FOREIGN KEY("policy_event_id") REFERENCES "policy_event"("policy_event_id")
);
CREATE TABLE IF NOT EXISTS "rating_territory" (
	"rating_territory_id"	INTEGER NOT NULL,
	"rating_territory_assigning_organization_id"	INTEGER,
	"rating_territory_code"	INTEGER,
	"rating_territory_code_set_identifier"	INTEGER,
	PRIMARY KEY("rating_territory_id")
);
CREATE TABLE IF NOT EXISTS "rating_territory_geographic_location" (
	"rating_territory_geographic_location_id"	INTEGER NOT NULL,
	"geographic_location_id"	INTEGER,
	"rating_territory_id"	INTEGER,
	PRIMARY KEY("rating_territory_geographic_location_id"),
	FOREIGN KEY("geographic_location_id") REFERENCES "geographic_location"("geographic_location_id"),
	FOREIGN KEY("rating_territory_id") REFERENCES "rating_territory"("rating_territory_id")
);
CREATE TABLE IF NOT EXISTS "recovery" (
	"recovery_id"	INTEGER NOT NULL,
	"claim_amount_id"	INTEGER,
	PRIMARY KEY("recovery_id"),
	FOREIGN KEY("claim_amount_id") REFERENCES "claim_amount"("claim_amount_id")
);
CREATE TABLE IF NOT EXISTS "recreational_vehicle" (
	"recreational_vehicle_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("recreational_vehicle_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "regional_office" (
	"regional_office_id"	INTEGER NOT NULL,
	"territory_id"	INTEGER,
	PRIMARY KEY("regional_office_id"),
	FOREIGN KEY("territory_id") REFERENCES "territory"("territory_id")
);
CREATE TABLE IF NOT EXISTS "reinstatement" (
	"reinstatement_id"	INTEGER NOT NULL,
	"policy_event_id"	INTEGER,
	PRIMARY KEY("reinstatement_id"),
	FOREIGN KEY("policy_event_id") REFERENCES "policy_event"("policy_event_id")
);
CREATE TABLE IF NOT EXISTS "reinsurance_agreement" (
	"reinsurance_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("reinsurance_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "policy"("policy_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "reinsurance_recovery" (
	"reinsurance_recovery_id"	INTEGER NOT NULL,
	"recovery_id"	INTEGER,
	PRIMARY KEY("reinsurance_recovery_id"),
	FOREIGN KEY("recovery_id") REFERENCES "recovery"("recovery_id")
);
CREATE TABLE IF NOT EXISTS "renewal" (
	"renewal_id"	INTEGER NOT NULL,
	"policy_event_id"	INTEGER,
	PRIMARY KEY("renewal_id"),
	FOREIGN KEY("policy_event_id") REFERENCES "policy_event"("policy_event_id")
);
CREATE TABLE IF NOT EXISTS "residential_structure" (
	"residential_structure_id"	INTEGER NOT NULL,
	"structure_id"	INTEGER,
	PRIMARY KEY("residential_structure_id"),
	FOREIGN KEY("structure_id") REFERENCES "structure"("structure_id")
);
CREATE TABLE IF NOT EXISTS "risk_factor_score" (
	"risk_factor_score_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("risk_factor_score_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "salvage" (
	"salvage_id"	INTEGER NOT NULL,
	"recovery_id"	INTEGER,
	PRIMARY KEY("salvage_id"),
	FOREIGN KEY("recovery_id") REFERENCES "recovery"("recovery_id")
);
CREATE TABLE IF NOT EXISTS "scheduled_item" (
	"scheduled_item_id"	INTEGER NOT NULL,
	"transportation_class_id"	INTEGER,
	PRIMARY KEY("scheduled_item_id"),
	FOREIGN KEY("transportation_class_id") REFERENCES "transportation_class"("transportation_class_id")
);
CREATE TABLE IF NOT EXISTS "service_provider" (
	"service_provider_id"	INTEGER NOT NULL,
	"agreement_role_id"	INTEGER,
	PRIMARY KEY("service_provider_id"),
	FOREIGN KEY("agreement_role_id") REFERENCES "agreement_role"("agreement_role_id")
);
CREATE TABLE IF NOT EXISTS "short_rate" (
	"short_rate_id"	INTEGER NOT NULL,
	"cancel_id"	INTEGER,
	PRIMARY KEY("short_rate_id"),
	FOREIGN KEY("cancel_id") REFERENCES "cancel"("cancel_id")
);
CREATE TABLE IF NOT EXISTS "staff" (
	"staff_id"	INTEGER NOT NULL,
	"party_role_code"	VARCHAR,
	PRIMARY KEY("staff_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "staff_classification" (
	"staff_classification_code"	INTEGER NOT NULL,
	"staff_classification_name"	VARCHAR,
	"staff_classification_description"	VARCHAR,
	PRIMARY KEY("staff_classification_code")
);
CREATE TABLE IF NOT EXISTS "staff_position" (
	"staff_position_id"	INTEGER NOT NULL,
	"staff_position_name"	VARCHAR,
	"staff_position_description"	VARCHAR,
	"staff_classification_code"	INTEGER,
	PRIMARY KEY("staff_position_id"),
	FOREIGN KEY("staff_classification_code") REFERENCES "staff_classification"("staff_classification_code")
);
CREATE TABLE IF NOT EXISTS "staff_position_assignment" (
	"staff_position_assignment_id"	INTEGER NOT NULL,
	"person_id"	INTEGER,
	"organization_id"	INTEGER,
	"staff_position_id"	INTEGER,
	"begin_date"	DATE,
	"end_date"	DATE,
	PRIMARY KEY("staff_position_assignment_id"),
	FOREIGN KEY("organization_id") REFERENCES "organization"("organization_id"),
	FOREIGN KEY("person_id") REFERENCES "person"("person_id"),
	FOREIGN KEY("staff_position_id") REFERENCES "staff_position"("staff_position_id")
);
CREATE TABLE IF NOT EXISTS "staff_role" (
	"staff_role_id"	INTEGER NOT NULL,
	"party_role_code"	VARCHAR,
	PRIMARY KEY("staff_role_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "staff_work_assignment" (
	"staff_work_assignment_id"	INTEGER NOT NULL,
	"person_id"	INTEGER,
	"organization_id"	INTEGER,
	"grouping_id"	INTEGER,
	"begin_date"	DATE,
	"party_role_code"	INTEGER,
	"end_date"	DATE,
	PRIMARY KEY("staff_work_assignment_id"),
	FOREIGN KEY("grouping_id") REFERENCES "grouping"("grouping_id"),
	FOREIGN KEY("organization_id") REFERENCES "organization"("organization_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code"),
	FOREIGN KEY("person_id") REFERENCES "person"("person_id")
);
CREATE TABLE IF NOT EXISTS "staffing_agreement" (
	"staffing_agreement_id"	INTEGER NOT NULL,
	"agreement_id"	INTEGER,
	PRIMARY KEY("staffing_agreement_id"),
	FOREIGN KEY("agreement_id") REFERENCES "agreement"("agreement_id")
);
CREATE TABLE IF NOT EXISTS "staffing_organization" (
	"staffing_organization_id"	INTEGER NOT NULL,
	"party_role_code"	VARCHAR,
	PRIMARY KEY("staffing_organization_id"),
	FOREIGN KEY("party_role_code") REFERENCES "party_role"("party_role_code")
);
CREATE TABLE IF NOT EXISTS "state" (
	"state_code"	VARCHAR NOT NULL,
	"state_name"	VARCHAR,
	PRIMARY KEY("state_code")
);
CREATE TABLE IF NOT EXISTS "structure" (
	"structure_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	PRIMARY KEY("structure_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id")
);
CREATE TABLE IF NOT EXISTS "subcontractor" (
	"subcontractor_id"	INTEGER NOT NULL,
	"contractor_id"	INTEGER,
	PRIMARY KEY("subcontractor_id"),
	FOREIGN KEY("contractor_id") REFERENCES "contractor"("contractor_id")
);
CREATE TABLE IF NOT EXISTS "subrogation" (
	"subrogation_id"	INTEGER NOT NULL,
	"recovery_id"	INTEGER,
	PRIMARY KEY("subrogation_id"),
	FOREIGN KEY("recovery_id") REFERENCES "recovery"("recovery_id")
);
CREATE TABLE IF NOT EXISTS "supplier" (
	"supplier_id"	INTEGER NOT NULL,
	"agreement_role_id"	INTEGER,
	PRIMARY KEY("supplier_id"),
	FOREIGN KEY("agreement_role_id") REFERENCES "agreement_role"("agreement_role_id")
);
CREATE TABLE IF NOT EXISTS "surcharge" (
	"surcharge_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("surcharge_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "tax" (
	"tax_id"	INTEGER NOT NULL,
	"policy_amount_id"	INTEGER,
	PRIMARY KEY("tax_id"),
	FOREIGN KEY("policy_amount_id") REFERENCES "policy_amount"("policy_amount_id")
);
CREATE TABLE IF NOT EXISTS "team" (
	"team_id"	INTEGER NOT NULL,
	"grouping_id"	INTEGER,
	PRIMARY KEY("team_id"),
	FOREIGN KEY("grouping_id") REFERENCES "grouping"("grouping_id")
);
CREATE TABLE IF NOT EXISTS "team_leader" (
	"team_leader_id"	INTEGER NOT NULL,
	"staff_role_id"	INTEGER,
	PRIMARY KEY("team_leader_id"),
	FOREIGN KEY("staff_role_id") REFERENCES "staff_role"("staff_role_id")
);
CREATE TABLE IF NOT EXISTS "team_member" (
	"team_member_id"	INTEGER NOT NULL,
	"staff_role_id"	INTEGER,
	PRIMARY KEY("team_member_id"),
	FOREIGN KEY("staff_role_id") REFERENCES "staff_role"("staff_role_id")
);
CREATE TABLE IF NOT EXISTS "territory" (
	"territory_id"	INTEGER NOT NULL,
	"field_organization_unit_id"	INTEGER,
	PRIMARY KEY("territory_id"),
	FOREIGN KEY("field_organization_unit_id") REFERENCES "field_organization_unit"("field_organization_unit_id")
);
CREATE TABLE IF NOT EXISTS "third_party_administrator" (
	"third_party_administrator_id"	INTEGER NOT NULL,
	"provider_id"	INTEGER,
	PRIMARY KEY("third_party_administrator_id"),
	FOREIGN KEY("provider_id") REFERENCES "provider"("provider_id")
);
CREATE TABLE IF NOT EXISTS "third_party_staffing_agreement" (
	"third_party_staffing_agreement_id"	INTEGER NOT NULL,
	"staffing_agreement_id"	INTEGER,
	PRIMARY KEY("third_party_staffing_agreement_id"),
	FOREIGN KEY("staffing_agreement_id") REFERENCES "staffing_agreement"("staffing_agreement_id")
);
CREATE TABLE IF NOT EXISTS "tractor" (
	"tractor_id"	INTEGER NOT NULL,
	"farm_equipment_id"	INTEGER,
	PRIMARY KEY("tractor_id"),
	FOREIGN KEY("farm_equipment_id") REFERENCES "farm_equipment"("farm_equipment_id")
);
CREATE TABLE IF NOT EXISTS "trailer" (
	"trailer_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("trailer_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "transportation_class" (
	"transportation_class_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	PRIMARY KEY("transportation_class_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id")
);
CREATE TABLE IF NOT EXISTS "truck" (
	"truck_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("truck_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "underwriting_assignment" (
	"underwriting_assignment_id"	INTEGER NOT NULL,
	"assessment_result_id"	INTEGER,
	PRIMARY KEY("underwriting_assignment_id"),
	FOREIGN KEY("assessment_result_id") REFERENCES "assessment_result"("assessment_result_id")
);
CREATE TABLE IF NOT EXISTS "van" (
	"van_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("van_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "vehicle" (
	"vehicle_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	"vehicle_model_year"	INTEGER,
	"vehicle_model_name"	VARCHAR,
	"vehicle_driving_wheel_quantity"	INTEGER,
	"vehicle_make_name"	VARCHAR,
	"vehicle_identification_number"	VARCHAR,
	PRIMARY KEY("vehicle_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id")
);
CREATE TABLE IF NOT EXISTS "victim" (
	"victim_id"	INTEGER NOT NULL,
	"claim_role_id"	INTEGER,
	PRIMARY KEY("victim_id"),
	FOREIGN KEY("claim_role_id") REFERENCES "claim_role"("claim_role_id")
);
CREATE TABLE IF NOT EXISTS "watercraft" (
	"watercraft_id"	INTEGER NOT NULL,
	"vehicle_id"	INTEGER,
	PRIMARY KEY("watercraft_id"),
	FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id")
);
CREATE TABLE IF NOT EXISTS "workers_comp_class" (
	"workers_comp_class_id"	INTEGER NOT NULL,
	"insurable_object_id"	INTEGER,
	PRIMARY KEY("workers_comp_class_id"),
	FOREIGN KEY("insurable_object_id") REFERENCES "insurable_object"("insurable_object_id")
);
COMMIT;
