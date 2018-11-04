defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) when planet == :earth do
    seconds / 31557600
  end
  
  def age_on(planet, seconds) when planet == :mercury do
    age_on(:earth, seconds ) / 0.2408467 
  end

  def age_on(planet, seconds) when planet == :venus do
    age_on(:earth, seconds ) / 0.61519726
  end

  def age_on(planet, seconds) when planet == :mars do
    age_on(:earth, seconds ) / 1.8808158
  end

  def age_on(planet, seconds) when planet == :jupiter do
    age_on(:earth, seconds ) / 11.862615
  end

  def age_on(planet, seconds) when planet == :uranus do
    age_on(:earth, seconds ) / 84.016846
  end

  def age_on(planet, seconds) when planet == :saturn do
    age_on(:earth, seconds ) / 29.447498 
  end
  
  def age_on(planet, seconds) when planet == :neptune do
    age_on(:earth, seconds ) / 164.79132
  end
end
