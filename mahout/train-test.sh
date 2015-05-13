#!/bin/bash
#
mahout seqdirectory -i /scratch/BBIW/classification/test/input -o /scratch/BBIW/classification/test/seq  -chunk 64 -xm sequential --overwrite;
#
mahout seq2sparse -i /scratch/BBIW/classification/test/seq/ -o /scratch/BBIW/classification/test/output -wt tfidf -ng 1 -n 2 --maxDFPercent 85 --minSupport 1 --overwrite --namedVector -a org.apache.lucene.analysis.core.WhitespaceAnalyzer;
#
mahout split -i /scratch/BBIW/classification/test/output/tfidf-vectors --trainingOutput /scratch/BBIW/classification/test/train-tfidf-vectors --testOutput /scratch/BBIW/classification/test/test-tfidf-vectors --randomSelectionPct 40 --overwrite --sequenceFiles -xm sequential;
#
mahout trainnb -i /scratch/BBIW/classification/test/train-tfidf-vectors -o /scratch/BBIW/classification/test/model -li /scratch/BBIW/classification/test/labelindex -ow -c;
#
mahout testnb -i /scratch/BBIW/classification/test/test-tfidf-vectors -m /scratch/BBIW/classification/test/model -l /scratch/BBIW/classification/test/labelindex -ow -o /scratch/BBIW/classification/test/resultTest -c;