require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'open all tasks page' do
    get tasks_path
    assert_response :success
  end

  test 'open task page' do
    get task_path(tasks(:one))
    assert_response :success
  end

  test 'open new task page' do
    get new_task_path
    assert_response :success
  end

  test 'create task success' do
    new_task_attrs = {
      name: 'New Task Name',
      creator: 'Test Script',
      completed: false
    }
    post tasks_path, params: { task: new_task_attrs }
    created_task = Task.find_by(new_task_attrs)
    assert created_task
    assert_redirected_to task_path(created_task)
  end

  test 'create task failed' do
    new_task_attrs = {
      creator: 'Test Script'
    }
    post tasks_path, params: { task: new_task_attrs }
    assert_response :unprocessable_entity

    created_task = Task.find_by(new_task_attrs)
    assert_not created_task
  end

  test 'update task success' do
    update_task_attrs = {
      name: 'New Task Name',
      creator: 'Test Script',
      completed: false
    }
    test_task = tasks(:one)

    patch task_path(test_task), params: { task: update_task_attrs }
    assert_redirected_to task_path(test_task)

    test_task.reload

    assert_equal test_task.name, update_task_attrs[:name]
    assert_equal test_task.creator, update_task_attrs[:creator]
    assert_equal test_task.completed, update_task_attrs[:completed]
  end

  test 'update task failed' do
    update_task_attrs = {
      status: 'invalid_status'
    }
    test_task = tasks(:one)

    patch task_path(test_task), params: { task: update_task_attrs }
    assert_response :unprocessable_entity

    assert_equal test_task.reload.status, 'new'
  end

  test 'destroy task success' do
    test_task = tasks(:one)
    delete task_path(test_task)
    assert_redirected_to tasks_path
    assert_not Task.find_by(id: test_task.id)
  end
end
