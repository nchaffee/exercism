module Dominoes
    def chain?(ary)
        ary.empty? || 
            (ary.size == 1 && all_doubles?(ary)) ||
            numbers_same_total(ary)
    end

    def numbers_same_total(ary)
        doubles, dominoes = ary.map(&:sort).partition(&method(:double?))
        repeats, dominoes = dominoes.partition {|d| dominoes.count(d) > 1}
        [doubles, repeats].each do |group|
            next if group.empty?
            return false unless nums_in(group).any?{|n| nums_in(dominoes).include?(n) }
        end
        dominoes.flatten.group_by{|num| num}.all?{|_num,nums| nums.count.even?}
    end

    def nums_in(group)
        group.flatten.uniq
    end

    def all_doubles?(ary)
        ary.all?(&method(:double?))
    end

    def double?(domino)
        domino == domino.reverse
    end
end
Dominoes.extend(Dominoes)
