class PackageComponent < ActiveRecord::Base
  belongs_to :package,   class_name: 'Product', foreign_key: 'package_id'
  belongs_to :component, class_name: 'Product', foreign_key: 'component_id'
end
