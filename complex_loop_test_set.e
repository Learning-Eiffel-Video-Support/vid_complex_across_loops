note
	description: "Demonstraction of complex across and from loops."
	testing: "type/manual"

			-- Hover and click open!
	EIS: "name=try", "src=https://www.eiffel.com"
	EIS: "name=buy", "src=https://account.eiffel.com/licenses/_/buy/"
			-- Code commercial for less than 41 cents a day!

	EiS: "name=other_demos", "src=https://github.com/Learning-Eiffel-Video-Support"

	EIS: "name=video_demo", "src=https://youtu.be/a1PBzXRhCEs"
	EIS: "name=learning_eiffel_channel", "src=https://www.youtube.com/playlist?list=PLf9JgTngKbj417KYiyb4iv88GYAlhN7FX"

class
	COMPLEX_LOOP_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	demonstration_test
			-- New test routine
		note
			testing:  "covers/{COMPLEX_LOOP_TEST_SET}.upper_bound",
					"execution/isolated",
					"execution/serial"
			other_notes: "[
				Try clicking the "Analyze" button --> Fix the "1 Hint"
				]"
		local
			l_primes: PRIMES
			v: INTEGER
			l_list: ARRAYED_LIST [INTEGER]
			l_numbers: INTEGER_INTERVAL
		do
			l_numbers := (1 |..| upper_bound)
			across l_numbers as ic from
				create l_primes
				create l_list.make (upper_bound)
				v := upper_bound
			invariant
				list_is_all_primes: across l_list as ic_list all l_primes.is_prime (ic_list.item) end
			loop
				if l_primes.is_prime (ic.item) then
					l_list.force (ic.item)
				end
				v := v - 1
			variant
				v
			end

				-- Tests related to the loop above
			assert_integers_equal ("101_range", 101, upper_bound)
			assert_integers_equal ("prime_count", 26, l_list.count)
		end

feature {NONE} -- Implementation

	upper_bound: INTEGER = 101
			-- What is the upper bound for our range?

end


