class PagesController < ApplicationController
  PIN_FORMAT = /\A\d{4,6}\z/

  # Demo data standing in for the three copy-pasted t1/t2/t3 pages.
  DEMO_TRANSACTIONS = {
    1 => { merchant: "Demo Coffee", amount: "R$35,00" },
    2 => { merchant: "Demo Market", amount: "R$120,50" },
    3 => { merchant: "Demo Pharmacy", amount: "R$18,90" }
  }.freeze

  def home
  end

  def scanner
  end

  def transaction
    @transaction = DEMO_TRANSACTIONS[params[:id].to_i]
    if @transaction.nil?
      head :not_found
    end
  end

  def pin
  end

  # Demo only: checks the PIN format, never stores or logs the PIN
  # (see config/initializers/filter_parameter_logging.rb).
  def summary
    @pin_valid = params[:pin].to_s.match?(PIN_FORMAT)
    if !@pin_valid
      render :summary, status: :unprocessable_entity
    end
  end
end
