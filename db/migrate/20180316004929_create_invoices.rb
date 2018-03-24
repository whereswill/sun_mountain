class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :status
      t.text :notes
      t.decimal :late_fee, precision: 6, scale: 2
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
