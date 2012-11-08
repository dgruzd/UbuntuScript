#!/usr/bin/env ruby

ram = ARGV.first.to_i
tables_count = 100
fast_cpu = true



puts "#### generated for #{ram}MB by nyaa ####"
puts "#### tables in all bases: #{tables_count}"
puts "shared_buffers = #{ram/8}MB" + " # 1/8 of RAM, can be raised to 1/4"
puts "work_mem = #{ram/20}MB"
puts "maintenance_work_mem = #{ram/4}MB"
puts "fsync = true"
puts "wal_sync_method = fdatasync"
puts "random_page_cost = #{(fast_cpu)? 2 : 4}" # 2 для быстрых cpu, 4 для медленных;
puts "cpu_tuple_cost = #{(fast_cpu)? 0.001 : 0.01}" #0.001 для быстрых cpu, 0.01 для медленных;
puts "cpu_index_tuple_cost = #{(fast_cpu)? 0.0005 : 0.005}"# 0.0005 для быстрых cpu, 0.005 для медленных;
#commit_delay = от 10 до 100 ;
#commit_siblings = от 5 до 10;
#effective_cache_size = 0.9 от значения cached, которое показывает free;
puts "autovacuum = on"
puts "autovacuum_vacuum_threshold = 1800"
puts "autovacuum_analyze_threshold = 900"
puts "####     end autoconf   ####"
