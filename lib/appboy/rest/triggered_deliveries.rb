module Appboy
  module REST
    class TriggeredDeliveries < Base
      attr_reader :app_group_id, :campaign_id, :trigger_properties, :recipient

      def initialize(app_group_id, campaign_id:, trigger_properties:, recipient: {})
        @app_group_id = app_group_id
        @campaign_id = campaign_id
        @trigger_properties = trigger_properties
        @recipient = recipient
      end

      def perform
        http.post '/campaigns/trigger/send', {
          app_group_id:       app_group_id,
          campaign_id:        campaign_id,
          trigger_properties: trigger_properties,
          recipients:         [recipient]
        }
      end
    end
  end
end
