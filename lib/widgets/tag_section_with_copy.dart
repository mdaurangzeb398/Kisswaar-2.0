final sorter = AutoTagSorter(productList);
final tagGroups = sorter.groupByTags();

TagSectionWithCopy(groupedTags: tagGroups);
