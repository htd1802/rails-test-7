class AddRenameMemberTypeToTypeForRelationship < ActiveRecord::Migration
  def change
    rename_column :relationships, :member_type, :type
  end
end
