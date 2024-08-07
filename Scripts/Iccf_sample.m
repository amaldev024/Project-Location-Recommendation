%%
%loading data from train.txt and test.txt
parpool('local',2); 
[train, test] = readData('C:\Users\admin\Downloads', 1);
data = train+test;
R = data>0;

%user_feature_matrix = readContent('C:\Users\admin\Downloads\user_feature.txt');
%item_feature_matrix = readContent('C:\Users\admin\Downloads\item_feature.txt');

%%
%execute piccf
tic
[P1, Q1] = piccf(train>0, 'K', 50, 'max_iter', 20);
[P2, Q2] = piccf(train>0, 'K', 50, 'max_iter', 30);
[P3, Q3] = piccf(train>0, 'K', 50, 'max_iter', 50);
[P4, Q4] = piccf(train>0, 'K', 50, 'max_iter', 70);
[P5, Q5] = piccf(train>0, 'K', 50, 'max_iter', 90);
[P6, Q6] = piccf(train>0, 'K', 50, 'max_iter', 100);%,'X',user_feature_matrix,'Y',item_feature_matrix);
toc
%%
%writing results to file
[n_user,n_item] = size(R);
file1 = fopen('C:\Users\admin\Downloads\results@20.txt','w');
file2 = fopen('C:\Users\admin\Downloads\results@30.txt','w');
file3 = fopen('C:\Users\admin\Downloads\results@50.txt','w');
file4 = fopen('C:\Users\admin\Downloads\results@70.txt','w');
file5 = fopen('C:\Users\admin\Downloads\results@90.txt','w');
file6 = fopen('C:\Users\admin\Downloads\results@100.txt','w');

h = waitbar(0,'Initializing waitbar...');
arr = zeros(n_item,1);
C1 = num2cell(Q1, 2);
C2 = num2cell(Q2, 2);
C3 = num2cell(Q3, 2);
C4 = num2cell(Q4, 2);
C5 = num2cell(Q5, 2);
C6 = num2cell(Q6, 2);

for i=1:n_user
    arr1 = cellfun(@(x)dot(P1(i,:).',x), C1);
    arr2 = cellfun(@(x)dot(P2(i,:).',x), C2);
    arr3 = cellfun(@(x)dot(P3(i,:).',x), C3);
    arr4 = cellfun(@(x)dot(P4(i,:).',x), C4);
    arr5 = cellfun(@(x)dot(P5(i,:).',x), C5);
    arr6 = cellfun(@(x)dot(P6(i,:).',x), C6);
    [arr1,idx1] = sort(arr1,1,'descend');
    [arr2,idx2] = sort(arr2,1,'descend');
    [arr3,idx3] = sort(arr3,1,'descend');
    [arr4,idx4] = sort(arr4,1,'descend');
    [arr5,idx5] = sort(arr5,1,'descend');
    [arr6,idx6] = sort(arr6,1,'descend');
    for k=1:10
        fprintf(file1,'%d %d\n',i,idx1(k));
    end
    for k=1:10
        fprintf(file2,'%d %d\n',i,idx2(k));
    end
    for k=1:10
        fprintf(file3,'%d %d\n',i,idx3(k));
    end
    for k=1:10
        fprintf(file4,'%d %d\n',i,idx4(k));
    end
    for k=1:10
        fprintf(file5,'%d %d\n',i,idx5(k));
    end
    for k=1:10
        fprintf(file6,'%d %d\n',i,idx6(k));
    end
    waitbar(i/n_user,h,sprintf('%d%% along...',i/n_user));
end
fclose(file1);
fclose(file2);
fclose(file3);
fclose(file4);
fclose(file5);
fclose(file6);
close(h);
