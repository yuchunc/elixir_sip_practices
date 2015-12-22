defmodule ZeldacatTest do
  use ExUnit.Case
  doctest Zeldacat

  test "something with a health componenet can_die" do
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
    assert HealthComponent.alive?(entity) == true

    Entity.notify(entity, {:hit, 50})
    assert HealthComponent.get_hp(entity) == 50

    Entity.notify(entity, {:heal, 25})
    assert HealthComponent.get_hp(entity) == 75

    Entity.notify(entity, {:hit, 75})
    assert HealthComponent.alive?(entity) == false
  end
end
