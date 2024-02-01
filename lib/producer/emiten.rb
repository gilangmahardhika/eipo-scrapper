require "bunny"

class Producer::Emiten

  def initialize
    # Start a communication session with RabbitMQ
    @conn = Bunny.new
    @conn.start

    # open a channel
    @ch = @conn.create_channel
  end

  def publish(data)
    q  = @ch.quorum_queue("emiten", durable: true, "x-queue-type" => "quorum", :exclusive => false, :auto_delete => false)
    # publish a message to the default exchange which then gets routed to this queue
    q.publish(data, routing_key: "emiten", persistent: false)
    @ch.close
    # close the connection
    @conn.close
  end
end