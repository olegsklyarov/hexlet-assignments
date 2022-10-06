require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'open all bulletins page' do
    get bulletins_path
    assert_response :success
  end

  test 'opens one bulletin page' do
    get bulletin_path(bulletins(:one))
    assert_response :success
  end
end
