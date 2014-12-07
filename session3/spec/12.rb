RSpec.describe 'refactoring' do
  describe 'original methods without block stubbed' do
    before :each do
      @order = double :order
      expect(@order).to receive(:compute_cost    ).once
      expect(@order).to receive(:compute_shipping).once
      expect(@order).to receive(:compute_tax     ).once
      expect(@order).to receive(:ship_goods      ).once
    end

    it 'pay_by_visa makes a payment with the ccn, and verifies the payment' do
      ccn = double :ccn
      expect(@order).to receive(:payment).once.with(:type => :visa, :ccn => ccn)
      expect(@order).to receive(:verify_payment)
      pay_by_visa @order, ccn
    end

    it 'pay_by_chec signs the payment' do
      expect(@order).to receive(:payment).once.with(:type => :check, :signed => true)
      pay_by_check @order
    end

    it 'pay_by_cash does nothing special' do
      expect(@order).to receive(:payment).once.with(:type => :cash)
      pay_by_cash @order
    end

    it 'pay_by_store_credit reduces the current user\'s store credit by the order\'s cost' do
      current_user = double :current_user
      store_credit = double :store_credit

      expect(@order      ).to receive(:payment).once.with(:type => :store_credit)
      expect(@order      ).to receive(:cost).once.and_return('$Initial store credit')
      expect(store_credit).to receive(:-).once.with('$Initial store credit').and_return('$Reduced store credit')
      expect(current_user).to receive(:store_credit).once.and_return(store_credit)
      expect(current_user).to receive(:store_credit=).once.with('$Reduced store credit')

      pay_by_store_credit @order , current_user
    end
  end

  describe 'methods do their work in the pay_by block (hence do nothing if it is not called)' do
    let(:order)   { double :order }
    before(:each) { allow(self).to receive(:pay_by) }

    it 'invokes nothing for pay_by_visa' do
      pay_by_visa order, double(:ccn)
    end

    it 'invokes nothing for pay_by_check' do
      pay_by_check order
    end

    it 'invokes nothing for pay_by_cash' do
      pay_by_cash order
    end

    it 'invokes nothing for pay_by_store_credit' do
      pay_by_store_credit order, double(:current_user)
    end
  end


  describe 'pay_by block' do
    it 'performs boilerplate computations, and delegates to the block at the appropriate time in the algorithm' do
      order = double :order
      expect(order).to receive(:compute_cost     ).ordered.once
      expect(order).to receive(:compute_shipping ).ordered.once
      expect(order).to receive(:compute_tax      ).ordered.once
      expect(order).to receive(:called_from_block).ordered.once
      expect(order).to receive(:ship_goods       ).ordered.once

      pay_by(order) { order.called_from_block }
    end
  end
end
