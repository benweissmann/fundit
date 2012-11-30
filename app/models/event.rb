class Event < ActiveRecord::Base
  attr_accessible :description, :name, :date, :solicit_email, :thank_you_email
  belongs_to :organization
  has_many :participations
  has_many :volunteers, :through => :participations

  validates :name, :organization_id, :presence => true

  after_initialize :init_msgs

  def init_msgs
    puts "FOO"
    return unless new_record?
    puts "BAR"

    self.solicit_email = <<-END_EMAIL.strip_heredoc
      Dear Friends,

      On {{date}}, I will be participating in {{name}} to support {{org}}. I'm writing to you to ask that you support me with a donation. You can donate online and track my progress at {{link}}.

      Thank you,
      {{volunteer}}
    END_EMAIL

    self.thank_you_email = <<-END_EMAIL.strip_heredoc
      Dear {{donor}},

      Thank you for supporting my participation in {{name}} to raise money for {{org}}. Your generous donation will help me achive my funraising goal. You can track my progress at {{link}}.

      Thank you for your support,
      {{volunteer}}
    END_EMAIL
  end
end
