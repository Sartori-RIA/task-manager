# frozen_string_literal: true

module TaskHelper
  def badge(task)
    badges = {
      'in_progress' => 'badge text-bg-primary',
      'completed' => 'badge text-bg-success',
      'failed' => 'badge text-bg-danger',
      'pending' => 'badge text-bg-secondary'
    }
    badges[task.status]
  end
end
