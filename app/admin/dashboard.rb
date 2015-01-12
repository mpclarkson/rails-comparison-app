ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Latest Products" do
          ul do
            Product.last(5).map do |p|
              li link_to(p.product_name, admin_product_path(p))
            end
          end
        end
      end

      column do
        panel "Latest Brands" do
          ul do
            Brand.last(5).map do |p|
              li link_to(p.name, admin_brand_path(p))
            end
          end
        end
      end

      column do
        panel "Latest Merchants" do
          ul do
            Merchant.last(5).map do |p|
              li link_to(p.name, admin_merchant_path(p))
            end
          end
        end
      end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    end
  end # content
end

