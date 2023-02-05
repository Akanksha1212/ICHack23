import random


MIN_BREATHES_PM, MAX_BREATHES_PM = 10, 15
HOUR = 8

apnea_event_data_in_2hrs = []

# 1. Generate apnea data per minute
for minute in range(HOUR*60):
  apnea_event_count =  random.choice([i for i in range(MIN_BREATHES_PM, MAX_BREATHES_PM)])
  sixty_seconds = [i for i in range(60)]
  apnea_event_data_in_a_min = [ 0 for i in range(60) ] # data init 

  # Populate data init 
  for i in range(apnea_event_count):
    second_chosen = random.choice(sixty_seconds)
    apnea_event_data_in_a_min[second_chosen] = 1
    sixty_seconds.remove(second_chosen)

  # Generate cumulative data
  anpea_count = 0
  for second in range(len(apnea_event_data_in_a_min)):
    if apnea_event_data_in_a_min[second] == 1: 
      anpea_count +=1
  
  apnea_event_data_in_2hrs = apnea_event_data_in_2hrs + apnea_event_data_in_a_min

# 2. calculate breathes per min
bps = []
for second in range(len(apnea_event_data_in_2hrs)):
  bps_s=0
  if second < 59: # zero indexing - within 60 seconds
    bps_s = apnea_event_data_in_2hrs[:second+1].count(1)  
  if second >= 59:
    bps_s = apnea_event_data_in_2hrs[second-59:second+1].count(1)
  bps.append(bps_s)

# 4. Reverse calculation
events = []

# first 60 secs
for sec in range(60):

  # Edge case - first second
  if sec == 0:
    if apnea_event_data_in_2hrs[0] == 1: events.append(1)
    else: events.append(0)
    continue

  # Normal case
  # Subsequent second, 1 if it goes up, 0 if it doesnt 
  if abs(bps[sec] - bps[sec-1]) == 1:
    events.append(1)
  else:
    events.append(0)

# After first 60 sec
bps_after_6 = bps[60:]
for sec in range(len(bps_after_6)):

  # Edge case - 61st second
  if sec == 0:
    events.append(abs(abs(bps_after_6[sec] - bps[59]) - events[sec]))
    continue

  # Normal case - 1 if it goes up, 0 if it doest -> do this after factoring out the last element in the previous cycle (of 60)
  else:
    events.append(abs(abs(bps_after_6[sec] - bps_after_6[sec-1]) - events[sec]))

# print(apnea_event_data_in_2hrs)
# print(bps)

# 3. Fake data
# apnea_event_data_in_2hrs = [0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0]
# bps = [0, 1, 1, 1, 1, 1, 2, 3, 4, 4, 4, 5, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 11, 11, 12, 13, 13, 13, 14, 14, 14, 14, 15, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 16, 16, 16, 16, 16, 15, 15, 15, 15, 15, 14, 14, 14, 13, 13, 12, 12, 12, 12, 13, 14, 15, 15, 15, 16, 16, 16, 16, 16, 17, 18, 17, 17, 17, 17, 16, 15, 16, 16, 15, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 17, 17, 17, 17, 16, 16, 16, 16, 16, 17, 17, 18, 17, 16, 15, 14, 14, 13, 14, 14, 14, 14, 13, 13, 13, 14, 14, 14, 15, 16, 15, 15, 16, 17, 17, 17, 16, 16, 16, 15, 15, 15, 15, 14, 15, 16, 16, 15, 15, 15, 16, 17, 17, 17, 17, 17, 16, 17, 17, 17, 17, 18, 18, 19, 20, 20, 20, 20, 21, 20, 20, 19, 19, 19, 19, 20, 20, 20, 19, 19, 19, 19, 20, 19, 19, 18, 17, 17, 17, 16, 16, 16, 15, 15, 15, 15, 16, 15, 15, 16, 16, 16, 16, 16, 15, 14, 15, 16, 17, 17, 17, 16, 17, 17, 17, 18, 18, 18, 18, 17, 17, 16, 16, 15, 14, 14, 14, 14, 14, 15, 15, 15, 16, 16, 17, 16, 16, 16, 16, 17, 17, 17, 16, 16, 16, 16, 17, 18, 17, 17, 17, 17, 17, 16, 16, 16, 15, 16, 16, 16, 16, 17, 18, 18, 18, 19, 18, 17, 16, 16, 15, 15]
print(apnea_event_data_in_2hrs == events)

count, apnea_event = 0, 0
for breathing in events:
  # If stop breathing, start counting
  if not breathing:
    count += 1
    continue

  else:
    if count and count > 15:
      apnea_event += 1
    count = 0

AHI = apnea_event/HOUR
print(AHI)