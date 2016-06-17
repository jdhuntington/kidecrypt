module Kidecrypt
  class Frequency

    CHARS = %w{ &#x203c; &#x2047; &#x2048; &#x2049; &#x2600; &#x2601; &#x2602; &#x2603; &#x2607; &#x2608; &#x2614; &#x2654; &#x2655; &#x2656; &#x2657; &#x2658; &#x2659; &#x265a; &#x265b; &#x265c; &#x265d; &#x265e; &#x265f; &#x26c5; &#x26c8; &#x2700; &#x2701; &#x2702; &#x2702; &#x2703; &#x2704; &#x2705; &#x2706; &#x2707; &#x2708; &#x2709; &#x270a; &#x270b; &#x270c; &#x270d; &#x270e; &#x270f; &#x2710; &#x2711; &#x2712; &#x2714; &#x2715; &#x2716; &#x2718; &#x2719; &#x271a; &#x271b; &#x271c; &#x271d; &#x271e; &#x271f; &#x2721; &#x2722; &#x2723; &#x2724; &#x2725; &#x2726; &#x2727; &#x2728; &#x2729; &#x272a; &#x272b; &#x272c; &#x272d; &#x272e; &#x272f; &#x2730; &#x2731; &#x2732; &#x2733; &#x2734; &#x2735; &#x2737; &#x2738; &#x2739; &#x273a; &#x273b; &#x273c; &#x273d; &#x273e; &#x273f; &#x2740; &#x2741; &#x2742; &#x2743; &#x2744; &#x2745; &#x2746; &#x2747; &#x2748; &#x2749; &#x274a; &#x274b; &#x274c; &#x274d; &#x274e; &#x274f; &#x2750; &#x2751; &#x2752; &#x2753; &#x2754; &#x2755; &#x2756; &#x2757; &#x2759; &#x275a; &#x275b; &#x275c; &#x275d; &#x275e; &#x275f; &#x2760; &#x2761; &#x2762; &#x2763; &#x2764; &#x2765; &#x2766; &#x2767; &#x2768; &#x2769; &#x276a; &#x276b; &#x276c; &#x276d; &#x276e; &#x276f; &#x2770; &#x2771; &#x2774; &#x2775; &#x2776; &#x2777; &#x2778; &#x2779; &#x277a; &#x277b; &#x277c; &#x277d; &#x277e; &#x277f; &#x2780; &#x2781; &#x2782; &#x2783; &#x2784; &#x2785; &#x2786; &#x2787; &#x2788; &#x2789; &#x278a; &#x278b; &#x278c; &#x278d; &#x278e; &#x278f; &#x2790; &#x2791; &#x2792; &#x2793; &#x2794; &#x2795; &#x2796; &#x2797; &#x2798; &#x2799; &#x279a; &#x279b; &#x279c; &#x279d; &#x279e; &#x279f; &#x27a0; &#x27a1; &#x27a2; &#x27a3; &#x27a4; &#x27a5; &#x27a6; &#x27a7; &#x27a8; &#x27a9; &#x27aa; &#x27ab; &#x27ac; &#x27ad; &#x27ae; &#x27af; &#x27b0; &#x27b1; &#x27b2; &#x27b3; }

    def initialize msg
      @msg = msg.downcase
      map_partial = CHARS.shuffle
      @map = {
        ' ' => '&nbsp;&nbsp;&nbsp; '
      }
      ('a'..'z').to_a.each { |x| @map[x] = map_partial.pop }
    end

    def frequency_map
      chars = Hash.new { |h,k| h[k] = 0 }
      @msg.each_char do |x|
        next unless @map[x]
        chars[x] += 1
      end
      chars
    end

    def ciphertext
      text = []
      @msg.each_char do |x|
        text << (@map[x] || x)
      end
      text.join('')
    end

    def key
      [['Letter', 'number of times it appears in the code']] + (frequency_map.to_a.sort_by { |x| 0 - x[1] })
    end

    def render(renderer)
      renderer.output_with_key(ciphertext, key)
    end
  end
end
