require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:archer)
    @other_user = users(:malory)
  end

  # Can't make this work. This gives a false positive
  # test "should not allow resending activation email when logged in as a non-admin" do
  #   log_in_as(@user)
  #   assert_no_difference @other_user.activation_digest do
  #     debugger
  #     controller.params[:id] = @other_user.id
  #     patch account_activation_path(@other_user)
  #   end
  #   assert_redirected_to root_url
  # end
end
