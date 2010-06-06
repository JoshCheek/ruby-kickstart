describe 'refactoring' do

  describe 'original methods without block stubbed' do
    before :each do
      @order = mock :order
      @order.should_receive(:compute_cost).once
      @order.should_receive(:compute_shipping).once
      @order.should_receive(:compute_tax).once
      @order.should_receive(:ship_goods).once
    end
  
    it 'should work for pay_by_visa' do
      ccn = mock :ccn
      @order.should_receive(:payment).once.with :type => :visa , :ccn => ccn
      @order.should_receive(:verify_payment)
      pay_by_visa @order , ccn
    end
  
    it 'should work for pay_by_check' do
      @order.should_receive(:payment).once.with :type => :check , :signed => true
      pay_by_check @order
    end
  
    it 'should work for pay_by_cash' do
      @order.should_receive(:payment).once.with :type => :cash
      pay_by_cash @order
    end 
  
    it 'should work for pay_by_store_credit' do
      @order.should_receive(:payment).once.with :type => :store_credit
      @order.should_receive(:cost).once.and_return(:'one million sollars')
      current_user = mock :current_user
      store_credit = mock :store_credit
      store_credit.should_receive(:-).once.with(:'one million sollars').and_return(:'still one million dollars')
      current_user.should_receive(:store_credit).once.and_return(store_credit)
      current_user.should_receive(:store_credit=).once.with(:'still one million dollars')
      pay_by_store_credit @order , current_user
    end
  end
  
  describe 'original methods with pay_by intercepted' do
    before :each do
      @order = mock :order
      stub!(:pay_by)
    end
  
    it 'should invoke nothing for pay_by_visa' do
      ccn = mock :ccn
      pay_by_visa @order , ccn
    end
  
    it 'should invoke nothing for pay_by_check' do
      pay_by_check @order
    end
  
    it 'should invoke nothing for pay_by_cash' do
      pay_by_cash @order
    end 
  
    it 'should invoke nothing for pay_by_store_credit' do
      current_user = mock :current_user
      pay_by_store_credit @order , current_user
    end
  end
  
  
  describe 'pay_by' do
    it 'should have a method pay_by that receives the order, computes boiler plate code, and invokes the block' do
      @order = mock :order
      @order.should_receive(:compute_cost).once
      @order.should_receive(:compute_shipping).once
      @order.should_receive(:compute_tax).once
      @order.should_receive(:ship_goods).once
      block_called = mock(:block_called)
      block_called.should_receive :block_was_called
      pay_by @order do
        block_called.block_was_called
      end
    end
  end
  
end