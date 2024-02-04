require "bunny"

class Producer::Emiten

  def initialize
    # Start a communication session with RabbitMQ
    @conn = Bunny.new(
      user: ENV["RABBIT_USER"],
      pass: ENV["RABBIT_PASS"],
      vhost: ENV["RABBIT_VHOST"]
    )
    @conn.start

    # open a channel
    @ch = @conn.create_channel
  end

  def publish(data)
    pp data
    q  = @ch.quorum_queue("emiten", durable: true, "x-queue-type" => "quorum", :exclusive => false, :auto_delete => false)
    q.publish(data, routing_key: "emiten", persistent: true)
  end

  def close
    @ch.close
    @conn.close
  end
end
