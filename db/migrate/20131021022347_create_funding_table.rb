class CreateFundingTable < ActiveRecord::Migration
  def change
    create_table :FundingOppSynopsis do |t|
      t.string :PostDate
      t.string :UserID
      t.string :Password
      t.string :FundingInstrumentType
      t.string :FundingActivityCategory
      t.text :OtherCategoryExplanation
      t.integer :NumberOfAwards
      t.integer :EstimatedFunding
      t.integer :AwardCeiling
      t.integer :AwardFloor
      t.string :AgencyMailingAddress
      t.string :FundingOppTitle
      t.string :FundingOppNumber
      t.string :ApplicationsDueDate
      t.string :ApplicationsDueDateExplanation
      t.string :ArchiveDate
      t.string :Location
      t.string :Office
      t.string :Agency
      t.text   :FundingOppDescription
      t.float  :CFDANumber
      t.integer :EligibilityCategory
      t.text   :AdditionalEligibilityInfo
      t.string :CostSharing
      t.string :ObtainFundingOppText
      t.string :AgencyContact

      t.timestamps
    end

  end
end
