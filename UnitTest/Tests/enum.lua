--===========================================================================--
--                                                                           --
--                             UnitTest For Enum                             --
--                                                                           --
--===========================================================================--

--===========================================================================--
-- Author       :   kurapica125@outlook.com                                  --
-- URL          :   http://github.com/kurapica/PLoop                         --
-- Create Date  :   2018/09/26                                               --
-- Update Date  :   2018/09/26                                               --
-- Version      :   1.0.0                                                    --
--===========================================================================--

UnitTest "PLoop.Enum" "1.0.0"

__Test__() function usage()
	namespace "UnitTest.EnumCase"

	enum "Direction" { North = 1, East = 2, South = 3, West = 4 }

	Assert.Equal(1, North)
	Assert.Equal(1, Direction.North)
	Assert.Nil(Direction.north)
	Assert.Equal("North", Direction(1))
	Assert.Nil(Direction(5))

	__AutoIndex__{ North = 1, South = 5 }
	enum "Direction" {
		"North",
		"East",
		"South",
		"West",
	}

	Assert.Equal(1, Direction.North)
	Assert.Equal(6, Direction.West)
	Assert.Equal("South", Direction(5))

	__Flags__()
	enum "WeekDay" {
		All = 0,
		"SUNDAY",
		"MONDAY",
		"TUESDAY",
		"WEDNESDAY",
		"THURSDAY",
		"FRIDAY",
		"SATURDAY",
	}

	Assert.Equal(0, WeekDay.All)
	Assert.Equal(1, SUNDAY)
	Assert.Equal(2^4, THURSDAY)

	local day = SUNDAY + MONDAY + FRIDAY

	Assert.True(System.Enum.ValidateFlags(SUNDAY, day))
	Assert.False(System.Enum.ValidateFlags(SATURDAY, day))
	Assert.Same({ SUNDAY = SUNDAY, MONDAY = MONDAY, FRIDAY = FRIDAY }, WeekDay(day, {}))
end