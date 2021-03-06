FactoryGirl.define do
  factory :client do
  end

  factory :robot do
    initialize_with { new }

    factory :robot_in_position do
      association :position, strategy: :build
    end
  end

  factory :arena do
    initialize_with { new width: 5, height: 5 }
  end

  factory :position do
    association :arena, strategy: :build
    initialize_with { new arena: arena }
  end

  factory :null_position do
  end

  factory :place_command do
    association :robot, strategy: :build
    association :arena, strategy: :build

    factory :place_command_with_inbounds_params do
      command = "place 0, 0, north"
      initialize_with { new robot: robot, command: command, arena: arena }
    end

    factory :place_command_with_out_of_bounds_params do

      command = "place 100, 100, west"
      initialize_with { new robot: robot, command: command, arena: arena }
    end
  end

  factory :move_command do
    association :robot, strategy: :build
    initialize_with { new robot: robot }
  end

  factory :left_command do
    association :robot, strategy: :build
    initialize_with { new robot: robot }
  end

  factory :right_command do
    association :robot, strategy: :build
    initialize_with { new robot: robot }
  end

  factory :report_command do
    association :robot, strategy: :build
    initialize_with { new robot: robot }
  end

  factory :invalid_command do
  end
end
